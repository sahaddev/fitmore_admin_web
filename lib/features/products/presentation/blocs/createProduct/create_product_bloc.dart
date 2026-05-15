import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../domain/entities/product.dart';

part 'create_product_event.dart';
part 'create_product_state.dart';
part 'create_product_bloc.freezed.dart';

class CreateProductBloc extends Bloc<CreateProductEvent, CreateProductState> {
  CreateProductBloc() : super(const CreateProductStateInitial()) {
    on<_PickImage>(_onPickImage);
    on<_CreateProduct>(_onCreateProduct);
  }

  FutureOr<void> _onPickImage(
    _PickImage event,
    Emitter<CreateProductState> emit,
  ) {}

  FutureOr<void> _onCreateProduct(
    _CreateProduct event,
    Emitter<CreateProductState> emit,
  ) {}
}
