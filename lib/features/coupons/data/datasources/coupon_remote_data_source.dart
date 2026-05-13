import 'package:dio/dio.dart';
import 'package:fitmore_web/core/network/dio_client.dart';
import 'package:fitmore_web/core/network/dio_error_handler.dart';
import '../models/coupon_model.dart';

abstract class CouponRemoteDataSource {
  Future<List<CouponModel>> getAllCoupons();
  Future<void> createCoupon(CouponModel coupon);
  Future<CouponModel> getCouponById(int id);
  Future<void> deleteCoupon(int id);
  Future<CouponModel> updateCoupon(int id, CouponModel coupon);
}

class CouponRemoteDataSourceImpl implements CouponRemoteDataSource {
  final DioClient _dioClient = DioClient.instance;

  @override
  Future<List<CouponModel>> getAllCoupons() async {
    try {
      final response = await _dioClient.get('/api/coupons');
      if (response.statusCode == 200) {
        return (response.data['datas'] as List<dynamic>)
            .map((json) => CouponModel.fromJson(json as Map<String, dynamic>))
            .toList();
      } else {
        throw DioException(
          requestOptions: RequestOptions(path: '/api/coupons'),
          message: "Failed to load coupons",
        );
      }
    } on DioException catch (e) {
      throw DioErrorHandler.handleDioError(e);
    } catch (e) {
      throw Exception('Failed to load coupons: $e');
    }
  }

  @override
  Future<void> createCoupon(CouponModel coupon) async {
    try {
      final response = await _dioClient.post(
        '/api/coupon',
        data: coupon.toJson(),
      );
      if (response.statusCode != 200 && response.statusCode != 201) {
        throw DioException(
          requestOptions: RequestOptions(path: '/api/coupon'),
          message: "Failed to create coupon",
        );
      }
    } on DioException catch (e) {
      throw DioErrorHandler.handleDioError(e);
    } catch (e) {
      throw Exception('Failed to create coupon: $e');
    }
  }

  @override
  Future<CouponModel> getCouponById(int id) async {
    try {
      final response = await _dioClient.get(
        '/api/coupon',
        queryParameters: {'id': id},
      );
      if (response.statusCode == 200) {
        return CouponModel.fromJson(response.data['coupon']);
      } else {
        throw DioException(
          requestOptions: RequestOptions(path: '/api/coupon'),
          message: "Failed to fetch coupon",
        );
      }
    } on DioException catch (e) {
      throw DioErrorHandler.handleDioError(e);
    } catch (e) {
      throw Exception('Failed to fetch coupon: $e');
    }
  }

  @override
  Future<void> deleteCoupon(int id) async {
    try {
      final response = await _dioClient.delete(
        '/api/coupon',
        queryParameters: {'id': id},
      );
      if (response.statusCode != 200) {
        throw DioException(
          requestOptions: RequestOptions(path: '/api/coupon'),
          message: "Failed to delete coupon",
        );
      }
    } on DioException catch (e) {
      throw DioErrorHandler.handleDioError(e);
    } catch (e) {
      throw Exception('Failed to delete coupon: $e');
    }
  }

  @override
  Future<CouponModel> updateCoupon(int id, CouponModel coupon) async {
    try {
      final response = await _dioClient.put(
        '/api/coupon',
        queryParameters: {'id': id},
        data: coupon.toJson(),
      );
      if (response.statusCode == 200) {
        return CouponModel.fromJson(response.data['coupon']);
      } else {
        throw DioException(
          requestOptions: RequestOptions(path: '/api/coupon'),
          message: "Failed to update coupon",
        );
      }
    } on DioException catch (e) {
      throw DioErrorHandler.handleDioError(e);
    } catch (e) {
      throw Exception('Failed to update coupon: $e');
    }
  }
}
