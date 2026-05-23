import 'package:fitmore_web/features/auth/data/repositories/auth_repository_impl.dart';
import 'package:fitmore_web/features/auth/domain/entities/auth_entity.dart';
import 'package:fitmore_web/features/auth/domain/entities/signup_entity.dart';
import 'package:fitmore_web/features/auth/domain/repositories/auth_repository.dart';

class AuthUsecase {
  final AuthRepository authRepository = AuthRepositoryImpl();

  Future<SignUpEntity> signUp({
    required String username,
    required String email,
    required String password,
    required String phoneNumber,
  }) async {
    return await authRepository.signUp(
      username: username,
      email: email,
      password: password,
      phoneNumber: phoneNumber,
    );
  }

  Future<AuthEntity> login({
    required String email,
    required String password,
  }) async {
    return await authRepository.login(
      email: email,
      password: password,
    );
  }
}
