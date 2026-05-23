import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:fitmore_web/core/constants/storage_key.dart';
import 'package:fitmore_web/core/di/service_locator.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/entities/auth_entity.dart';
import '../../domain/entities/signup_entity.dart';
import '../../domain/usecases/auth_usecase.dart';

part 'auth_event.dart';
part 'auth_state.dart';
part 'auth_bloc.freezed.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthUsecase _authUsecase = AuthUsecase();

  AuthBloc() : super(const _Initial()) {
    on<_CreateUser>(_onCreateUser);
    on<_LoginUser>(_onLoginUser);
  }

  FutureOr<void> _onCreateUser(
    _CreateUser event,
    Emitter<AuthState> emit,
  ) async {
    emit(const AuthState.loading());
    try {
      final result = await _authUsecase.signUp(
        username: event.username,
        email: event.email,
        password: event.password,
        phoneNumber: event.phoneNumber,
      );
      if (result.status) {
        emit(AuthState.signUpSuccess(result));
      } else {
        emit(AuthState.failure(result.message));
      }
    } catch (e) {
      emit(AuthState.failure(e.toString()));
    }
  }

  FutureOr<void> _onLoginUser(_LoginUser event, Emitter<AuthState> emit) async {
    emit(const AuthState.loading());
    try {
      final result = await _authUsecase.login(
        email: event.email,
        password: event.password,
      );
      if (result.status) {
        await ServiceLocator.storageService.saveString(
          StorageKey.token,
          result.token,
        );
        await ServiceLocator.storageService.saveBool(StorageKey.isLogin, true);
        emit(AuthState.loginSuccess(result));
      } else {
        emit(AuthState.failure(result.message));
      }
    } catch (e) {
      emit(AuthState.failure(e.toString()));
    }
  }
}
