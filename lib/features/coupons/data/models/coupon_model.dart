import '../../domain/entities/coupon.dart';

class CouponModel extends CouponEntity {
  const CouponModel({
    super.id,
    super.mongoId,
    required super.title,
    required super.code,
    super.description,
    super.expiry,
    super.status,
    super.limit,
    super.couponCount,
    super.percentage,
    super.fixedAmount,
    super.createdAt,
    super.updatedAt,
  });

  factory CouponModel.fromJson(Map<String, dynamic> json) {
    return CouponModel(
      id: json['id'],
      mongoId: json['_id'],
      title: json['title'] ?? '',
      code: json['code']?.toString() ?? '',
      description: json['description'],
      expiry: json['expiry'] != null ? DateTime.parse(json['expiry']) : null,
      status: json['status'] ?? 'active',
      limit: json['limit'] ?? 0,
      couponCount: json['couponCount'] ?? 0,
      percentage: json['percentage'],
      fixedAmount: json['fixedAmount'],
      createdAt: json['createdAt'] != null ? DateTime.parse(json['createdAt']) : null,
      updatedAt: json['updatedAt'] != null ? DateTime.parse(json['updatedAt']) : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'code': code,
      if (description != null) 'description': description,
      if (expiry != null) 'expiry': expiry!.toIso8601String(),
      'status': status,
      'limit': limit,
      'couponCount': couponCount,
      if (percentage != null) 'percentage': percentage,
      if (fixedAmount != null) 'fixedAmount': fixedAmount,
    };
  }

  factory CouponModel.fromEntity(CouponEntity entity) {
    return CouponModel(
      id: entity.id,
      mongoId: entity.mongoId,
      title: entity.title,
      code: entity.code,
      description: entity.description,
      expiry: entity.expiry,
      status: entity.status,
      limit: entity.limit,
      couponCount: entity.couponCount,
      percentage: entity.percentage,
      fixedAmount: entity.fixedAmount,
      createdAt: entity.createdAt,
      updatedAt: entity.updatedAt,
    );
  }
}
