import 'package:flutter/foundation.dart';
import '../data/auth_repository.dart';
import '../model/user_model.dart';

class AuthViewModel extends ChangeNotifier {
  final AuthRepository _authRepository;

  AuthViewModel(this._authRepository);

  UserModel? _user;
  UserModel? get user => _user;

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  String? _error;
  String? get error => _error;

  bool get isAuthenticated =>
      _user != null; // Simple check, real apps might check token persistence

  Future<bool> login(String email, String password) async {
    _isLoading = true;
    _error = null;
    notifyListeners();

    try {
      _user = await _authRepository.login(email, password);
      _isLoading = false;
      notifyListeners();
      return true;
    } catch (e) {
      _error = e.toString().replaceAll('Exception: ', '');
      _isLoading = false;
      notifyListeners();
      return false;
    }
  }

  Future<void> logout() async {
    await _authRepository.logout();
    _user = null;
    notifyListeners();
  }

  // Method to check initial auth state (e.g. from shared prefs) would go here
  Future<void> checkLoginStatus() async {
    // enhance: retrieve user details if token exists
    if (await _authRepository.isLoggedIn()) {
      // In real app, fetch user profile
      _user = UserModel(
        id: '1',
        email: 'restored@example.com',
        name: 'Restored User',
        token: 'restored_token',
      );
      notifyListeners();
    }
  }
}
