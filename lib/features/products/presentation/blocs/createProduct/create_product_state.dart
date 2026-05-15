part of 'create_product_bloc.dart';

@freezed
sealed class CreateProductState with _$CreateProductState {
  const factory CreateProductState.initial() = CreateProductStateInitial;
  const factory CreateProductState.loading() = CreateProductStateLoading;
  const factory CreateProductState.success() = CreateProductStateSuccess;
  const factory CreateProductState.failure(String message) =
      CreateProductStateFailure;
}
