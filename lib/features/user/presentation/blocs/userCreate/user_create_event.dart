part of 'user_create_bloc.dart';

@freezed
class UserCreateEvent with _$UserCreateEvent {
  const factory UserCreateEvent.pickProductImage() = _PickProductImage;
  const factory UserCreateEvent.updateUser({required UserEntity user}) =
      _UpdateUser;
  const factory UserCreateEvent.createUser({required UserEntity user}) =
      _CreateUser;
}
