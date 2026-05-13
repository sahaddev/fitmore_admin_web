import 'package:equatable/equatable.dart';

class CouponEntity extends Equatable {
  final int? id;
  final String? mongoId;
  final String title;
  final String code;
  final String? description;
  final DateTime? expiry;
  final String status;
  final int limit;
  final int couponCount;
  final int? percentage;
  final int? fixedAmount;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  const CouponEntity({
    this.id,
    this.mongoId,
    required this.title,
    required this.code,
    this.description,
    this.expiry,
    this.status = 'active',
    this.limit = 0,
    this.couponCount = 0,
    this.percentage,
    this.fixedAmount,
    this.createdAt,
    this.updatedAt,
  });

  @override
  List<Object?> get props => [
        id,
        mongoId,
        title,
        code,
        description,
        expiry,
        status,
        limit,
        couponCount,
        percentage,
        fixedAmount,
        createdAt,
        updatedAt,
      ];
}
