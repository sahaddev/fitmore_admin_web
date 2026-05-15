part of 'coupon_add_and_l_ist_bloc.dart';

@freezed
sealed class CouponAddAndLIstEvent with _$CouponAddAndLIstEvent {
  const factory CouponAddAndLIstEvent.fetchCoupons() = _FetchCoupons;
  const factory CouponAddAndLIstEvent.addCoupon({required CouponEntity coupon}) =
      _AddCoupon;
}