part of 'product_list_bloc.dart';

@freezed
sealed class ProductListState with _$ProductListState {
  const factory ProductListState.initial() = ProductListStateInitial;
  const factory ProductListState.loading() = ProductListStateLoading;
  const factory ProductListState.loaded(List<ProductEntity> products) =
      ProductListStateLoaded;
  const factory ProductListState.failure(String message) =
      ProductListStateFailure;
}
