import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../domain/entities/product.dart';

part 'product_deatile_event.dart';
part 'product_deatile_state.dart';
part 'product_deatile_bloc.freezed.dart';

class ProductDeatileBloc extends Bloc<ProductDeatileEvent, ProductDeatileState> {
  ProductDeatileBloc() : super(const ProductDeatileStateInitial()) {
    on<_FetchProductDetail>(_onFetchProductDetail);
  }

  FutureOr<void> _onFetchProductDetail(
    _FetchProductDetail event,
    Emitter<ProductDeatileState> emit,
  ) {}
}
