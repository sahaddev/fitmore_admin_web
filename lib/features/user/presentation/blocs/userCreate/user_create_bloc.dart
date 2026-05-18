import 'dart:async';
import 'dart:convert';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:file_picker/file_picker.dart';

import '../../../domain/entities/user.dart';
import '../../../domain/usecases/user_usecase.dart';

part 'user_create_event.dart';
part 'user_create_state.dart';
part 'user_create_bloc.freezed.dart';

class UserCreateBloc extends Bloc<UserCreateEvent, UserCreateState> {
  final UserUsecase _userUsecase = UserUsecase();
  String? _pickedImageBase64;

  UserCreateBloc() : super(const UserCreateStateInitial()) {
    on<_PickProductImage>(_onPickProductImage);
    on<_UpdateUser>(_onUpdateUser);
    on<_CreateUser>(_onCreateUser);
  }

  FutureOr<void> _onPickProductImage(
    _PickProductImage event,
    Emitter<UserCreateState> emit,
  ) async {
    try {
      FilePickerResult? result = await FilePicker.pickFiles(
        type: FileType.image,
        withData: true,
      );

      if (result != null && result.files.single.bytes != null) {
        final bytes = result.files.single.bytes!;
        final extension = result.files.single.extension ?? 'png';
        final base64Image =
            'data:image/$extension;base64,${base64Encode(bytes)}';

        _pickedImageBase64 = base64Image;
        // Emit loaded state with the new image, so UI can show the preview
        emit(
          UserCreateState.loaded(
            user: UserEntity(
              username: '',
              email: '',
              password: '',
              profileImage: base64Image,
            ),
          ),
        );
      }
    } catch (e) {
      emit(UserCreateState.error('Failed to pick image: $e'));
    }
  }

  FutureOr<void> _onUpdateUser(
    _UpdateUser event,
    Emitter<UserCreateState> emit,
  ) async {
    emit(const UserCreateState.loading());
    try {
      final userToUpdate = _pickedImageBase64 != null
          ? UserEntity(
              id: event.user.id,
              mongoId: event.user.mongoId,
              username: event.user.username,
              email: event.user.email,
              password: event.user.password,
              phoneNumber: event.user.phoneNumber,
              ordersCount: event.user.ordersCount,
              createdAt: event.user.createdAt,
              updatedAt: event.user.updatedAt,
              active: event.user.active,
              profileImage: _pickedImageBase64,
            )
          : event.user;

      if (userToUpdate.id == null) {
        throw Exception('User ID is missing');
      }

      await _userUsecase.updateUser(userToUpdate.id!, userToUpdate);
      emit(const UserCreateState.success());
    } catch (e) {
      emit(UserCreateState.error(e.toString()));
    }
  }

  FutureOr<void> _onCreateUser(
    _CreateUser event,
    Emitter<UserCreateState> emit,
  ) async {
    emit(const UserCreateState.loading());
    try {
      final userToCreate = _pickedImageBase64 != null
          ? UserEntity(
              id: event.user.id,
              mongoId: event.user.mongoId,
              username: event.user.username,
              email: event.user.email,
              password: event.user.password,
              phoneNumber: event.user.phoneNumber,
              ordersCount: event.user.ordersCount,
              createdAt: event.user.createdAt,
              updatedAt: event.user.updatedAt,
              active: event.user.active,
              profileImage: _pickedImageBase64,
            )
          : event.user;
      await _userUsecase.createUser(userToCreate);
      log('user created successfully');
      emit(const UserCreateState.success());
    } catch (e) {
      log('error in user creation ${e.toString()}');
      emit(UserCreateState.error(e.toString()));
    }
  }
}
