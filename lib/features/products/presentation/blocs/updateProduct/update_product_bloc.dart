import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../domain/entities/product.dart';
import '../../../domain/usecases/product_usecase.dart';

part 'update_product_event.dart';
part 'update_product_state.dart';
part 'update_product_bloc.freezed.dart';

class UpdateProductBloc extends Bloc<UpdateProductEvent, UpdateProductState> {
  final ProductUsecase _productUsecase = ProductUsecase();

  UpdateProductBloc() : super(const UpdateProductStateInitial()) {
    on<_UpdateProduct>(_onUpdateProduct);
  }

  FutureOr<void> _onUpdateProduct(
    _UpdateProduct event,
    Emitter<UpdateProductState> emit,
  ) async {
    emit(const UpdateProductState.loading());
    try {
      await _productUsecase.updateProduct(event.product.id!, event.product);
      emit(const UpdateProductState.success());
    } catch (e) {
      emit(UpdateProductState.failure(e.toString()));
    }
  }
}
