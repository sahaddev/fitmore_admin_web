part of 'product_list_bloc.dart';

@freezed
sealed class ProductListEvent with _$ProductListEvent {
  const factory ProductListEvent.fetchProducts() = _FetchProducts;
  const factory ProductListEvent.deleteProduct(int id) = _DeleteProduct;
}