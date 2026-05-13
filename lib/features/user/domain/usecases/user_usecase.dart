import 'package:fitmore_web/features/user/data/repositories/user_repository_impl.dart';

import '../entities/user.dart';
import '../repositories/user_repository.dart';

class UserUsecase {
  final UserRepository userRepository = UserRepositoryImpl();
  Future<List<UserEntity>> getAllUsers() async {
    return await userRepository.getUsers();
  }
}
