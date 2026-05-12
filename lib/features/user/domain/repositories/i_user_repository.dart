import '../entities/user.dart';

abstract class IUserRepository {
  Future<List<User>> getUsers();
}
