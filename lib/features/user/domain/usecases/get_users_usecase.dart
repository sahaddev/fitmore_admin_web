import '../entities/user.dart';
import '../repositories/i_user_repository.dart';

class GetUsersUseCase {
  final IUserRepository repository;

  GetUsersUseCase(this.repository);

  Future<List<User>> call() {
    return repository.getUsers();
  }
}
