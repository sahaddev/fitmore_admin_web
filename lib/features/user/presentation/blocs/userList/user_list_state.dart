part of 'user_list_bloc.dart';

@freezed
class UserListState with _$UserListState {
  const factory UserListState.initial() = UserListStateInitial;
  const factory UserListState.loading() = UserListStateLoading;
  const factory UserListState.loaded(List<UserEntity> users) =
      UserListStateLoaded;
  const factory UserListState.failure(String message) = UserListStateFailure;
  const factory UserListState.success() = UserListStateSuccess;
}
