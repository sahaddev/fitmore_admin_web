import 'package:fitmore_web/features/user/data/models/user_model.dart';
import 'package:fitmore_web/features/user/domain/entities/user.dart';

import '../../domain/repositories/user_repository.dart';
import '../datasources/user_remote_data_source.dart';

class UserRepositoryImpl implements UserRepository {
  final UserRemoteDataSource remoteDataSource = UserRemoteDataSourceImpl();

  @override
  Future<List<UserEntity>> getUsers() async {
    return remoteDataSource.getUsers();
  }

  @override
  Future<UserEntity> createUser(UserEntity user) async {
    final userModel = UserModel.fromEntity(user);
    return remoteDataSource.createUser(userModel);
  }

  @override
  Future<UserEntity> getUserById(int id) async {
    return remoteDataSource.getUserById(id);
  }

  @override
  Future<void> deleteUser(int id) async {
    return remoteDataSource.deleteUser(id);
  }

  @override
  Future<UserEntity> updateUser(int id, UserEntity user) async {
    final userModel = UserModel.fromEntity(user);
    return remoteDataSource.updateUser(id, userModel);
  }
}
