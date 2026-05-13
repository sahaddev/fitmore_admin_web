import 'package:fitmore_web/features/user/domain/entities/user.dart';

import '../../domain/repositories/user_repository.dart';
import '../datasources/user_remote_data_source.dart';

class UserRepositoryImpl implements UserRepository {
  final UserRemoteDataSource remoteDataSource = UserRemoteDataSourceImpl();

  @override
  Future<List<UserEntity>> getUsers() async {
    return remoteDataSource.getUsers();
  }
}
