part of 'create_product_bloc.dart';

@freezed
sealed class CreateProductEvent with _$CreateProductEvent {
  const factory CreateProductEvent.pickImage() = _PickImage;
  const factory CreateProductEvent.createProduct(
      {required ProductEntity product}) = _CreateProduct;
}