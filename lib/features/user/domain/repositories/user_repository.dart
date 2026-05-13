import '../entities/user.dart';

abstract class UserRepository {
  Future<List<UserEntity>> getUsers();
}
