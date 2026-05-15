part of 'product_deatile_bloc.dart';

@freezed
sealed class ProductDeatileState with _$ProductDeatileState {
  const factory ProductDeatileState.initial() = ProductDeatileStateInitial;
  const factory ProductDeatileState.loading() = ProductDeatileStateLoading;
  const factory ProductDeatileState.loaded(ProductEntity product) =
      ProductDeatileStateLoaded;
  const factory ProductDeatileState.failure(String message) =
      ProductDeatileStateFailure;
}
