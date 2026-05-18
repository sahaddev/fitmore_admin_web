import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:fitmore_web/features/coupons/domain/entities/coupon.dart';
import 'package:fitmore_web/features/coupons/domain/usecases/coupon_usecase.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'coupon_update_event.dart';
part 'coupon_update_state.dart';
part 'coupon_update_bloc.freezed.dart';

class CouponUpdateBloc extends Bloc<CouponUpdateEvent, CouponUpdateState> {
  final CouponUsecase _couponUsecase = CouponUsecase();

  CouponUpdateBloc() : super(const CouponUpdateStateInitial()) {
    on<_UpdateCoupon>(_onUpdateCoupon);
  }

  FutureOr<void> _onUpdateCoupon(
    _UpdateCoupon event,
    Emitter<CouponUpdateState> emit,
  ) async {
    emit(const CouponUpdateState.loading());
    try {
      final id = event.coupon.id;
      if (id == null) {
        emit(const CouponUpdateState.failure("Coupon ID is missing."));
        return;
      }
      await _couponUsecase.updateCoupon(id, event.coupon);
      emit(const CouponUpdateState.success());
    } catch (e) {
      emit(CouponUpdateState.failure(e.toString()));
    }
  }
}
