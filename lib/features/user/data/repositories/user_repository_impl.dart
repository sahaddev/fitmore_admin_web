import '../../domain/entities/user.dart';
import '../../domain/repositories/i_user_repository.dart';
import '../datasources/user_remote_data_source.dart';
import '../models/user_model.dart';

class UserRepositoryImpl implements IUserRepository {
  final UserRemoteDataSource remoteDataSource;

  UserRepositoryImpl(this.remoteDataSource);

  @override
  Future<List<User>> getUsers() async {
    final usersJson = await remoteDataSource.getUsers();
    return usersJson.map((json) => UserModel.fromJson(json)).toList().cast<User>();
  }
}
