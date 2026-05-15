part of 'update_product_bloc.dart';

@freezed
sealed class UpdateProductState with _$UpdateProductState {
  const factory UpdateProductState.initial() = UpdateProductStateInitial;
  const factory UpdateProductState.loading() = UpdateProductStateLoading;
  const factory UpdateProductState.success() = UpdateProductStateSuccess;
  const factory UpdateProductState.failure(String message) =
      UpdateProductStateFailure;
}
