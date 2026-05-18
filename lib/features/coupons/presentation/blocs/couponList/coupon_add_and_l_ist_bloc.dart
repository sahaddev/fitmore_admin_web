import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:fitmore_web/features/coupons/domain/entities/coupon.dart';
import 'package:fitmore_web/features/coupons/domain/usecases/coupon_usecase.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'coupon_add_and_l_ist_event.dart';
part 'coupon_add_and_l_ist_state.dart';
part 'coupon_add_and_l_ist_bloc.freezed.dart';

class CouponAddAndLIstBloc
    extends Bloc<CouponAddAndLIstEvent, CouponAddAndLIstState> {
  final CouponUsecase _couponUsecase = CouponUsecase();

  CouponAddAndLIstBloc() : super(const CouponAddAndLIstStateInitial()) {
    on<_FetchCoupons>(_onFetchCoupons);
    on<_AddCoupon>(_onAddCoupon);
  }

  FutureOr<void> _onFetchCoupons(
    _FetchCoupons event,
    Emitter<CouponAddAndLIstState> emit,
  ) async {
    emit(const CouponAddAndLIstState.loading());
    try {
      final coupons = await _couponUsecase.getAllCoupons();
      emit(CouponAddAndLIstState.loaded(coupons));
    } catch (e) {
      emit(CouponAddAndLIstState.failure(e.toString()));
    }
  }

  FutureOr<void> _onAddCoupon(
    _AddCoupon event,
    Emitter<CouponAddAndLIstState> emit,
  ) async {
    emit(const CouponAddAndLIstState.loading());
    try {
      await _couponUsecase.createCoupon(event.coupon);
      emit(const CouponAddAndLIstState.success());
    } catch (e) {
      emit(CouponAddAndLIstState.failure(e.toString()));
    }
  }
}
