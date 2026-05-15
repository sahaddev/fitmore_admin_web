import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:fitmore_web/features/coupons/domain/entities/coupon.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'coupon_update_event.dart';
part 'coupon_update_state.dart';
part 'coupon_update_bloc.freezed.dart';

class CouponUpdateBloc extends Bloc<CouponUpdateEvent, CouponUpdateState> {
  CouponUpdateBloc() : super(const CouponUpdateStateInitial()) {
    on<_UpdateCoupon>(_onUpdateCoupon);
  }

  FutureOr<void> _onUpdateCoupon(
    _UpdateCoupon event,
    Emitter<CouponUpdateState> emit,
  ) {}
}
