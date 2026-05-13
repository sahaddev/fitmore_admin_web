import 'package:equatable/equatable.dart';

class UserEntity extends Equatable {
  final int? id;
  final String? mongoId;
  final String username;
  final String email;
  final String password;
  final String? phoneNumber;
  final int ordersCount;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final bool active;
  final String? profileImage;

  const UserEntity({
    this.id,
    this.mongoId,
    required this.username,
    required this.email,
    required this.password,
    this.phoneNumber,
    this.ordersCount = 0,
    this.createdAt,
    this.updatedAt,
    this.active = true,
    this.profileImage,
  });

  @override
  List<Object?> get props => [
        id,
        mongoId,
        username,
        email,
        password,
        phoneNumber,
        ordersCount,
        createdAt,
        updatedAt,
        active,
        profileImage,
      ];
}
