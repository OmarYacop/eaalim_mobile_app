import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

import '../../api/models/user_model/user_model.dart';


part 'auth_event.dart';
part 'auth_state.dart';
part 'auth_bloc.freezed.dart';

class AuthBloc extends HydratedBloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthState.initial()) {
    on<Authenticated>((event, emit) {
      emit(state.copyWith(user: event.user, token: event.token));
    });
  }

  @override
  AuthState? fromJson(Map<String, dynamic> json) {
    return AuthState(
        user: json['data']['original']['user'] != null
            ? UserEntity.fromJson(json['data']['original']['user'])
            : null,
        token: json['data']['original']['access_token']);
  }

  @override
  Map<String, dynamic>? toJson(AuthState state) {
    return {
      'user': state.user != null ? state.user!.toJson() : null,
      'token': state.token,
    };
  }
}
