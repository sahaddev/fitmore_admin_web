import '../../domain/entities/coupon.dart';
import '../../domain/repositories/coupon_repository.dart';
import '../datasources/coupon_remote_data_source.dart';
import '../models/coupon_model.dart';

class CouponRepositoryImpl implements CouponRepository {
  final CouponRemoteDataSource remoteDataSource = CouponRemoteDataSourceImpl();

  @override
  Future<List<CouponEntity>> getAllCoupons() async {
    return await remoteDataSource.getAllCoupons();
  }

  @override
  Future<void> createCoupon(CouponEntity coupon) async {
    final couponModel = CouponModel.fromEntity(coupon);
    return await remoteDataSource.createCoupon(couponModel);
  }

  @override
  Future<CouponEntity> getCouponById(int id) async {
    return await remoteDataSource.getCouponById(id);
  }

  @override
  Future<void> deleteCoupon(int id) async {
    return await remoteDataSource.deleteCoupon(id);
  }

  @override
  Future<CouponEntity> updateCoupon(int id, CouponEntity coupon) async {
    final couponModel = CouponModel.fromEntity(coupon);
    return await remoteDataSource.updateCoupon(id, couponModel);
  }
}
