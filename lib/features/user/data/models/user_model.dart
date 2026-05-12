import '../../domain/entities/user.dart';

class UserModel extends User {
  UserModel({
    required super.id,
    required super.name,
    required super.email,
    required super.phone,
    required super.orders,
    super.recentOrders,
    required super.joinDate,
    required super.status,
    required super.avatarUrl,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'] ?? '',
      name: json['name'] ?? '',
      email: json['email'] ?? '',
      phone: json['phone'] ?? '',
      orders: json['orders'] ?? 0,
      recentOrders: json['recentOrders'],
      joinDate: json['joinDate'] != null 
          ? DateTime.parse(json['joinDate']) 
          : DateTime.now(),
      status: json['status'] ?? 'Active',
      avatarUrl: json['avatarUrl'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'phone': phone,
      'orders': orders,
      'recentOrders': recentOrders,
      'joinDate': joinDate.toIso8601String(),
      'status': status,
      'avatarUrl': avatarUrl,
    };
  }
}
