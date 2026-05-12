import 'package:flutter/foundation.dart';
import '../../domain/entities/user.dart';
import '../../domain/usecases/get_users_usecase.dart';

class UserViewModel extends ChangeNotifier {
  final GetUsersUseCase _getUsersUseCase;

  UserViewModel(this._getUsersUseCase);

  List<User> _users = [];
  List<User> get users => _users;

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  String? _error;
  String? get error => _error;

  String _searchQuery = '';
  String get searchQuery => _searchQuery;

  String _activeTab = 'All Users';
  String get activeTab => _activeTab;

  void setActiveTab(String tab) {
    _activeTab = tab;
    notifyListeners();
  }

  void setSearchQuery(String query) {
    _searchQuery = query;
    notifyListeners();
  }

  List<User> get filteredUsers {
    List<User> filtered = _users;

    // Filter by tab
    if (_activeTab == 'Active') {
      filtered = filtered.where((u) => u.status == 'Active').toList();
    } else if (_activeTab == 'Flagged') {
      filtered = filtered.where((u) => u.status == 'Inactive').toList();
    }

    // Filter by search query
    if (_searchQuery.isNotEmpty) {
      filtered = filtered.where((u) =>
          u.name.toLowerCase().contains(_searchQuery.toLowerCase()) ||
          u.email.toLowerCase().contains(_searchQuery.toLowerCase()) ||
          u.id.toLowerCase().contains(_searchQuery.toLowerCase())).toList();
    }

    return filtered;
  }

  Future<void> fetchUsers() async {
    _isLoading = true;
    _error = null;
    notifyListeners();

    try {
      _users = await _getUsersUseCase();
      _isLoading = false;
      notifyListeners();
    } catch (e) {
      _error = e.toString();
      _isLoading = false;
      notifyListeners();
    }
  }
}
