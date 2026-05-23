part of 'auth_bloc.dart';

@freezed
class AuthState with _$AuthState {
  const factory AuthState.initial() = _Initial;
  const factory AuthState.loading() = _Loading;
  const factory AuthState.signUpSuccess(SignUpEntity signUpEntity) = _SignUpSuccess;
  const factory AuthState.loginSuccess(AuthEntity authEntity) = _LoginSuccess;
  const factory AuthState.failure(String message) = _Failure;
}
