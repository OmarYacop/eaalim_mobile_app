part of 'auth_bloc.dart';

@freezed
class AuthState with _$AuthState {
  const factory AuthState({
    UserEntity? user,
    String? token,
  }) = _AuthState;
  factory AuthState.initial() {
    return const AuthState(user: null, token: null);
  }
}
