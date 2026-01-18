import '../model/user_model.dart';
import 'auth_api.dart';
import '../../../core/services/storage_service.dart';

class AuthRepository {
  final AuthApi _authApi;
  final StorageService _storageService;

  AuthRepository(this._authApi, this._storageService);

  Future<UserModel> login(String email, String password) async {
    try {
      final data = await _authApi.login(email, password);
      final user = UserModel.fromJson(data);
      await _storageService.saveToken(user.token);
      return user;
    } catch (e) {
      rethrow;
    }
  }

  Future<void> logout() async {
    await _storageService.clearToken();
  }

  Future<bool> isLoggedIn() async {
    final token = await _storageService.getToken();
    return token != null;
  }
}
