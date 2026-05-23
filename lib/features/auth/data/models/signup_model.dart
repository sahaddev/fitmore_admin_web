import 'package:fitmore_web/features/auth/domain/entities/signup_entity.dart';

class SignUpModel extends SignUpEntity {
  const SignUpModel({
    required super.status,
    required super.message,
  });

  factory SignUpModel.fromJson(Map<String, dynamic> json) {
    return SignUpModel(
      status: json['status'] ?? false,
      message: json['message'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'status': status,
      'message': message,
    };
  }
}
