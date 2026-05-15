part of 'coupon_update_bloc.dart';

@freezed
sealed class CouponUpdateState with _$CouponUpdateState {
  const factory CouponUpdateState.initial() = CouponUpdateStateInitial;
  const factory CouponUpdateState.loading() = CouponUpdateStateLoading;
  const factory CouponUpdateState.success() = CouponUpdateStateSuccess;
  const factory CouponUpdateState.failure(String message) =
      CouponUpdateStateFailure;
}
