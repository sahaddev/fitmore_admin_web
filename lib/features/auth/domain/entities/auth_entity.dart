import 'package:equatable/equatable.dart';
import 'package:fitmore_web/features/user/domain/entities/user.dart';

class AuthEntity extends Equatable {
  final bool status;
  final String message;
  final String token;
  final UserEntity user;

  const AuthEntity({
    required this.status,
    required this.message,
    required this.token,
    required this.user,
  });

  @override
  List<Object?> get props => [status, message, token, user];
}
