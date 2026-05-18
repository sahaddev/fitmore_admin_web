import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:fitmore_web/features/coupons/domain/entities/coupon.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'coupon_add_and_l_ist_event.dart';
part 'coupon_add_and_l_ist_state.dart';
part 'coupon_add_and_l_ist_bloc.freezed.dart';

class CouponAddAndLIstBloc
    extends Bloc<CouponAddAndLIstEvent, CouponAddAndLIstState> {
  CouponAddAndLIstBloc() : super(const CouponAddAndLIstStateInitial()) {
    on<_FetchCoupons>(_onFetchCoupons);
    on<_AddCoupon>(_onAddCoupon);
  }

  FutureOr<void> _onFetchCoupons(
    _FetchCoupons event,
    Emitter<CouponAddAndLIstState> emit,
  ) {}

  FutureOr<void> _onAddCoupon(
    _AddCoupon event,
    Emitter<CouponAddAndLIstState> emit,
  ) {}
}
