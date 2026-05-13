import '../entities/user.dart';

abstract class UserRepository {
  Future<List<UserEntity>> getUsers();
  Future<UserEntity> createUser(UserEntity user);
  Future<UserEntity> getUserById(int id);
  Future<void> deleteUser(int id);
  Future<UserEntity> updateUser(int id, UserEntity user);
}
