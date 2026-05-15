import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:fitmore_web/features/user/domain/entities/user.dart';

part 'user_list_event.dart';
part 'user_list_state.dart';
part 'user_list_bloc.freezed.dart';

class UserListBloc extends Bloc<UserListEvent, UserListState> {
  UserListBloc() : super(const UserListState.initial()) {
    on<_FetchUsers>(_onFetchUsers);
  }

  FutureOr<void> _onFetchUsers(
    _FetchUsers event,
    Emitter<UserListState> emit,
  ) {}
}
