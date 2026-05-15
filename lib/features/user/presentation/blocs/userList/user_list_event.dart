part of 'user_list_bloc.dart';

@freezed
sealed class UserListEvent with _$UserListEvent {
  const factory UserListEvent.fetchUsers() = _FetchUsers;
}
