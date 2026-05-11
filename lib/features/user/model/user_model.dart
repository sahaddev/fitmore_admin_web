class UserModel {
  final String id;
  final String name;
  final String email;
  final String phone;
  final int orders;
  final int? recentOrders;
  final DateTime joinDate;
  final String status;
  final String avatarUrl;

  UserModel({
    required this.id,
    required this.name,
    required this.email,
    required this.phone,
    required this.orders,
    this.recentOrders,
    required this.joinDate,
    required this.status,
    required this.avatarUrl,
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
