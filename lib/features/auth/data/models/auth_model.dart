import 'package:fitmore_web/features/auth/domain/entities/auth_entity.dart';
import 'package:fitmore_web/features/user/data/models/user_model.dart';

class AuthModel extends AuthEntity {
  const AuthModel({
    required super.status,
    required super.message,
    required super.token,
    required super.user,
  });

  factory AuthModel.fromJson(Map<String, dynamic> json) {
    return AuthModel(
      status: json['status'] ?? false,
      message: json['message'] ?? '',
      token: json['token'] ?? '',
      user: UserModel.fromJson(json['user'] ?? {}),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'status': status,
      'message': message,
      'token': token,
      'user': (user as UserModel).toJson(),
    };
  }
}
