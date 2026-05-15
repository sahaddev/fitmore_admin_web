part of 'product_deatile_bloc.dart';

@freezed
sealed class ProductDeatileEvent with _$ProductDeatileEvent {
  const factory ProductDeatileEvent.fetchProductDetail({required int id}) =
      _FetchProductDetail;
}