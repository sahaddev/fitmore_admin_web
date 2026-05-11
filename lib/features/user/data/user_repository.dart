import '../model/user_model.dart';
import 'user_api.dart';

class UserRepository {
  final UserApi _userApi;

  UserRepository(this._userApi);

  Future<List<UserModel>> getUsers() async {
    try {
      final List<Map<String, dynamic>> data = await _userApi.getUsers();
      return data.map((json) => UserModel.fromJson(json)).toList();
    } catch (e) {
      rethrow;
    }
  }
}
