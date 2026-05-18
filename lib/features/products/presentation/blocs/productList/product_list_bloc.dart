import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../domain/entities/product.dart';
import '../../../domain/usecases/product_usecase.dart';

part 'product_list_event.dart';
part 'product_list_state.dart';
part 'product_list_bloc.freezed.dart';

class ProductListBloc extends Bloc<ProductListEvent, ProductListState> {
  final ProductUsecase _productUsecase = ProductUsecase();

  ProductListBloc() : super(const ProductListStateInitial()) {
    on<_FetchProducts>(_onFetchProducts);
  }

  FutureOr<void> _onFetchProducts(
    _FetchProducts event,
    Emitter<ProductListState> emit,
  ) async {
    emit(const ProductListState.loading());
    try {
      final products = await _productUsecase.getAllProducts();
      emit(ProductListState.loaded(products));
    } catch (e) {
      emit(ProductListState.failure(e.toString()));
    }
  }
}
