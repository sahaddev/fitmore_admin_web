part of 'user_create_bloc.dart';

@freezed
sealed class UserCreateState with _$UserCreateState {
  const factory UserCreateState.initial() = UserCreateStateInitial;
  const factory UserCreateState.loading() = UserCreateStateLoading;
  const factory UserCreateState.loaded({UserEntity? user}) =
      UserCreateStateLoaded;
  const factory UserCreateState.error(String message) = UserCreateStateError;
  const factory UserCreateState.success() = UserCreateStateSuccess;
}
