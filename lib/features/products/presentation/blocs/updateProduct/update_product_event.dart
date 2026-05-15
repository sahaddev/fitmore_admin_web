part of 'update_product_bloc.dart';

@freezed
sealed class UpdateProductEvent with _$UpdateProductEvent {
  const factory UpdateProductEvent.updateProduct(
      {required ProductEntity product}) = _UpdateProduct;
}