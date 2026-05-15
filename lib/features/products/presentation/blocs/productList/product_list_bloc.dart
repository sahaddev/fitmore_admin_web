import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../domain/entities/product.dart';

part 'product_list_event.dart';
part 'product_list_state.dart';
part 'product_list_bloc.freezed.dart';

class ProductListBloc extends Bloc<ProductListEvent, ProductListState> {
  ProductListBloc() : super(const ProductListStateInitial()) {
    on<_FetchProducts>(_onFetchProducts);
  }

  FutureOr<void> _onFetchProducts(
    _FetchProducts event,
    Emitter<ProductListState> emit,
  ) {}
}
