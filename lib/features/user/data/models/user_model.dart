import '../../domain/entities/user.dart';

class UserModel extends UserEntity {
  const UserModel({
    super.id,
    super.mongoId,
    required super.username,
    required super.email,
    required super.password,
    super.phoneNumber,
    super.ordersCount,
    super.createdAt,
    super.updatedAt,
    super.active,
    super.profileImage,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'],
      mongoId: json['_id'],
      username: json['username'] ?? '',
      email: json['email'] ?? '',
      password: json['password'] ?? '',
      phoneNumber: json['phone_number'],
      ordersCount: json['ordersCount'] ?? 0,
      createdAt: json['created_at'] != null
          ? DateTime.parse(json['created_at'])
          : (json['createdAt'] != null
                ? DateTime.parse(json['createdAt'])
                : null),
      updatedAt: json['updatedAt'] != null
          ? DateTime.parse(json['updatedAt'])
          : null,
      active: json['active'] ?? true,
      profileImage: json['profile_image'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'username': username,
      'email': email,
      'password': password,
      if (phoneNumber != null) 'phone_number': phoneNumber,
      'ordersCount': ordersCount,
      'active': active,
    };
  }

  factory UserModel.fromEntity(UserEntity entity) {
    return UserModel(
      id: entity.id,
      mongoId: entity.mongoId,
      username: entity.username,
      email: entity.email,
      password: entity.password,
      phoneNumber: entity.phoneNumber,
      ordersCount: entity.ordersCount,
      createdAt: entity.createdAt,
      updatedAt: entity.updatedAt,
      active: entity.active,
      profileImage: entity.profileImage,
    );
  }
}
