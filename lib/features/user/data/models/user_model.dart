import '../../domain/entities/user.dart';

class UserModel extends UserEntity {
  const UserModel({
    required super.id,
    required super.name,
    required super.email,
    required super.phoneNumber,
    required super.ordersCount,
    required super.createdAt,
    required super.active,
    required super.avatarUrl,
    required super.password,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'] ?? '',
      name: json['username'] ?? '',
      email: json['email'] ?? '',
      password: json['password'] ?? '',
      phoneNumber: json['phone_number'] ?? '',
      ordersCount: json['ordersCount'] ?? 0,
      createdAt: json['created_at'] != null
          ? DateTime.parse(json['createdAt'])
          : DateTime.now(),
      active: json['active'] == true,
      avatarUrl: json['profile_image'] ?? '',
    );
  }

  UserEntity toEntity() {
    return UserEntity(
      id: id,
      name: name,
      email: email,
      password: password,
      phoneNumber: phoneNumber,
      ordersCount: ordersCount,
      createdAt: createdAt,
      active: active,
      avatarUrl: avatarUrl,
    );
  }
}
