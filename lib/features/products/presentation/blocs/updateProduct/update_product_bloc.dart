import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../domain/entities/product.dart';

part 'update_product_event.dart';
part 'update_product_state.dart';
part 'update_product_bloc.freezed.dart';

class UpdateProductBloc extends Bloc<UpdateProductEvent, UpdateProductState> {
  UpdateProductBloc() : super(const UpdateProductStateInitial()) {
    on<_UpdateProduct>(_onUpdateProduct);
  }

  FutureOr<void> _onUpdateProduct(
    _UpdateProduct event,
    Emitter<UpdateProductState> emit,
  ) {}
}
