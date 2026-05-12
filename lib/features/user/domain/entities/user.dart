class User {
  final String id;
  final String name;
  final String email;
  final String phone;
  final int orders;
  final int? recentOrders;
  final DateTime joinDate;
  final String status;
  final String avatarUrl;

  User({
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
}
