import 'package:equatable/equatable.dart';

class UserEntity extends Equatable {
  final String id;
  final String name;
  final String? email;
  final String? password;
  final String? phoneNumber;
  final int ordersCount;
  final DateTime createdAt;
  final bool active;
  final String? avatarUrl;

  const UserEntity({
    required this.id,
    required this.name,
    required this.email,
    required this.phoneNumber,
    required this.ordersCount,
    required this.createdAt,
    required this.active,
    required this.avatarUrl,
    required this.password,
  });

  @override
  List<Object?> get props => [
    id,
    name,
    email,
    phoneNumber,
    ordersCount,
    createdAt,
    active,
    avatarUrl,
  ];
}
