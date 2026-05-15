part of 'coupon_add_and_l_ist_bloc.dart';

@freezed
sealed class CouponAddAndLIstState with _$CouponAddAndLIstState {
  const factory CouponAddAndLIstState.initial() = CouponAddAndLIstStateInitial;
  const factory CouponAddAndLIstState.loading() = CouponAddAndLIstStateLoading;
  const factory CouponAddAndLIstState.loaded(List<CouponEntity> coupons) =
      CouponAddAndLIstStateLoaded;
  const factory CouponAddAndLIstState.success() = CouponAddAndLIstStateSuccess;
  const factory CouponAddAndLIstState.failure(String message) =
      CouponAddAndLIstStateFailure;
}
