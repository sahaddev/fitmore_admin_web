import '../entities/coupon.dart';
import '../repositories/coupon_repository.dart';
import '../../data/repositories/coupon_repository_impl.dart';

class CouponUsecase {
  final CouponRepository couponRepository = CouponRepositoryImpl();

  Future<List<CouponEntity>> getAllCoupons() async {
    return await couponRepository.getAllCoupons();
  }

  Future<void> createCoupon(CouponEntity coupon) async {
    return await couponRepository.createCoupon(coupon);
  }

  Future<CouponEntity> getCouponById(int id) async {
    return await couponRepository.getCouponById(id);
  }

  Future<void> deleteCoupon(int id) async {
    return await couponRepository.deleteCoupon(id);
  }

  Future<CouponEntity> updateCoupon(int id, CouponEntity coupon) async {
    return await couponRepository.updateCoupon(id, coupon);
  }
}
