import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../api/data/fetched_user_data.dart';
import '../../api/models/requests/requests.dart';
import '../../api/models/user_model/user_model.dart';
import '../../api/repository/auth/auth_repo.dart';
import '../../common/services/secure_storage.dart';
import '../../constants/widgets/flutter_toast.dart';
import '../../global.dart';
import '../auth_bloc/auth_bloc.dart';
import '../login_bloc/user_event.dart';
import '../login_bloc/user_bloc.dart';

part 'guest_state.dart';
part 'guest_cubit.freezed.dart';

class GuestCubit extends Cubit<GuestState> {
  final AuthRepository _authRepository;
  final AuthBloc _authBloc;

  GuestCubit(
      {required AuthRepository authRepository, required AuthBloc authBloc})
      : _authRepository = authRepository,
        _authBloc = authBloc,
        super(
          const GuestState.initial(),
        );

  Future<void> signIn(BuildContext context, String username, String password,
      bool isTeacher) async {
    final response = await _authRepository.login(
        LoginRequest(username: username, password: password), isTeacher);
    if (response['data'] != null) {
      switch (response['status']) {
        case 200:
          _authBloc.add(Authenticated(
            token: response['data']['original']['access_token'],
            user: UserEntity.fromJson(response['data']['original']['user']),
          ));
          UserData.setUserData(response['data']['original'], isTeacher);
          Global.username = username;
          Global.password = password;

          /// save user data in UserData class
          UserSecureStorage.saveVariable('username', username);
          UserSecureStorage.saveVariable('password', password);
          UserSecureStorage.saveVariable(
              'lastSignInType', isTeacher ? 'Teacher' : 'Student');

        case 400:
          toastInfo(
              msg:
                  'Bad request, couldn\'t find a user with this username and password');
          Future.delayed(Duration.zero,
              () => context.read<CredsBloc>().add(const CredsEvent(true)));
        case 500:
          toastInfo(msg: 'Server is experiencing some issues');
        default:
          toastInfo(msg: 'Unknown error, contact support');
      }
    } else {
      toastInfo(msg: 'Check your internet connection');
    }
  }

  Future<String?> signOut() async {
    _authRepository.logout();
    _authBloc.add(const Authenticated(
      token: null,
      user: null,
    ));
    return null;
  }

  Future<String?> refresh(String token) async {
    final response = await _authRepository.refresh(RefreshRequest(
      token: token,
    ));
    return response;
  }
}
