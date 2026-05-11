class AuthApi {
  AuthApi();

  Future<Map<String, dynamic>> login(String email, String password) async {
    // MOCK IMPLEMENTATION for demo purposes
    await Future.delayed(const Duration(seconds: 1)); // Simulate network delay
    if (email == 'user@example.com' && password == 'password123') {
      return {
        'id': '1',
        'email': email,
        'name': 'John Doe',
        'token': 'mock_token_12345',
      };
    } else {
      // In real app: return await _apiService.post(ApiConstants.loginEndpoint, {'email': email, 'password': password});
      throw Exception('Invalid credentials');
    }
  }
}
