import 'package:fitmore_web/features/auth/domain/entities/auth_entity.dart';
import 'package:fitmore_web/features/auth/domain/entities/signup_entity.dart';

abstract class AuthRepository {
  Future<SignUpEntity> signUp({
    required String username,
    required String email,
    required String password,
    required String phoneNumber,
  });

  Future<AuthEntity> login({
    required String email,
    required String password,
  });
}
