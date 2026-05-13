import '../entities/coupon.dart';

abstract class CouponRepository {
  Future<List<CouponEntity>> getAllCoupons();
  Future<void> createCoupon(CouponEntity coupon);
  Future<CouponEntity> getCouponById(int id);
  Future<void> deleteCoupon(int id);
  Future<CouponEntity> updateCoupon(int id, CouponEntity coupon);
}
