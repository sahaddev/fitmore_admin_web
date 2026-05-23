import 'package:fitmore_web/features/auth/data/datasources/auth_remote_data_source.dart';
import 'package:fitmore_web/features/auth/domain/entities/auth_entity.dart';
import 'package:fitmore_web/features/auth/domain/entities/signup_entity.dart';
import 'package:fitmore_web/features/auth/domain/repositories/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource remoteDataSource = AuthRemoteDataSourceImpl();

  @override
  Future<SignUpEntity> signUp({
    required String username,
    required String email,
    required String password,
    required String phoneNumber,
  }) async {
    return await remoteDataSource.signUp(
      username: username,
      email: email,
      password: password,
      phoneNumber: phoneNumber,
    );
  }

  @override
  Future<AuthEntity> login({
    required String email,
    required String password,
  }) async {
    return await remoteDataSource.login(
      email: email,
      password: password,
    );
  }
}
