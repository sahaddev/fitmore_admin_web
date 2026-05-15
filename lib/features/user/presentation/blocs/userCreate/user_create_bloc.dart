import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../domain/entities/user.dart';

part 'user_create_event.dart';
part 'user_create_state.dart';
part 'user_create_bloc.freezed.dart';

class UserCreateBloc extends Bloc<UserCreateEvent, UserCreateState> {
  UserCreateBloc() : super(const UserCreateStateInitial()) {
    on<_PickProductImage>(_onPickProductImage);
    on<_UpdateUser>(_onUpdateUser);
    on<_CreateUser>(_onCreateUser);
  }

  FutureOr<void> _onPickProductImage(
    _PickProductImage event,
    Emitter<UserCreateState> emit,
  ) {}

  FutureOr<void> _onUpdateUser(
    _UpdateUser event,
    Emitter<UserCreateState> emit,
  ) {}

  FutureOr<void> _onCreateUser(
    _CreateUser event,
    Emitter<UserCreateState> emit,
  ) {}
}
