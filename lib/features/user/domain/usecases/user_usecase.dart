import 'package:fitmore_web/features/user/data/repositories/user_repository_impl.dart';

import '../entities/user.dart';
import '../repositories/user_repository.dart';

class UserUsecase {
  final UserRepository userRepository = UserRepositoryImpl();

  Future<List<UserEntity>> getAllUsers() async {
    return await userRepository.getUsers();
  }

  Future<UserEntity> createUser(UserEntity user) async {
    return await userRepository.createUser(user);
  }

  Future<UserEntity> getUserById(int id) async {
    return await userRepository.getUserById(id);
  }

  Future<void> deleteUser(int id) async {
    return await userRepository.deleteUser(id);
  }

  Future<UserEntity> updateUser(int id, UserEntity user) async {
    return await userRepository.updateUser(id, user);
  }
}
