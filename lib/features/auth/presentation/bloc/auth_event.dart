part of 'auth_bloc.dart';

@freezed
class AuthEvent with _$AuthEvent {
  const factory AuthEvent.started() = _Started;

  const factory AuthEvent.createUser({
    required String username,
    required String email,
    required String password,
    required String phoneNumber,
  }) = _CreateUser;

  const factory AuthEvent.loginUser({
    required String email,
    required String password,
  }) = _LoginUser;
}