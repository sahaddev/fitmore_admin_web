part of 'coupon_update_bloc.dart';

@freezed
sealed class CouponUpdateEvent with _$CouponUpdateEvent {
  const factory CouponUpdateEvent.updateCoupon({required CouponEntity coupon}) =
      _UpdateCoupon;
}
