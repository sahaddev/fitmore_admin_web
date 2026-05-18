import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:fitmore_web/features/user/domain/entities/user.dart';
import 'package:fitmore_web/features/user/domain/usecases/user_usecase.dart';

part 'user_list_event.dart';
part 'user_list_state.dart';
part 'user_list_bloc.freezed.dart';

class UserListBloc extends Bloc<UserListEvent, UserListState> {
  final UserUsecase _userUsecase = UserUsecase();

  UserListBloc() : super(const UserListState.initial()) {
    on<_FetchUsers>(_onFetchUsers);
  }

  FutureOr<void> _onFetchUsers(
    _FetchUsers event,
    Emitter<UserListState> emit,
  ) async {
    emit(const UserListState.loading());
    try {
      final users = await _userUsecase.getAllUsers();
      emit(UserListState.loaded(users));
    } catch (e) {
      emit(UserListState.failure(e.toString()));
    }
  }
}
