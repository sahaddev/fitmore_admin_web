class UserApi {
  UserApi();

  Future<List<Map<String, dynamic>>> getUsers() async {
    // MOCK IMPLEMENTATION for demo purposes
    
    return [
      {
        'id': '#49201',
        'name': 'Alex Rivera',
        'email': 'alex.rivera@email.com',
        'phone': '+1 (555) 0123',
        'orders': 42,
        'recentOrders': 5,
        'joinDate': '2023-10-12T10:45:00',
        'status': 'Active',
        'avatarUrl': 'https://i.pravatar.cc/150?u=1',
      },
      {
        'id': '#49202',
        'name': 'Sarah Chen',
        'email': 'sarah.c@corp.net',
        'phone': '+1 (555) 0987',
        'orders': 15,
        'joinDate': '2023-11-05T14:12:00',
        'status': 'Active',
        'avatarUrl': 'https://i.pravatar.cc/150?u=2',
      },
      {
        'id': '#49203',
        'name': 'Marcus Wright',
        'email': 'm.wright@email.com',
        'phone': '+1 (555) 4433',
        'orders': 0,
        'joinDate': '2023-12-01T09:30:00',
        'status': 'Inactive',
        'avatarUrl': 'https://i.pravatar.cc/150?u=3',
      },
      {
        'id': '#49204',
        'name': 'Jordan Smith',
        'email': 'jordan.s@provider.com',
        'phone': '+1 (555) 7788',
        'orders': 8,
        'joinDate': '2023-12-15T23:58:00',
        'status': 'Active',
        'avatarUrl': 'https://i.pravatar.cc/150?u=4',
      },
      {
        'id': '#49205',
        'name': 'Elena Rodriguez',
        'email': 'elena.r@email.com',
        'phone': '+1 (555) 2299',
        'orders': 27,
        'joinDate': '2024-01-10T16:00:00',
        'status': 'Active',
        'avatarUrl': 'https://i.pravatar.cc/150?u=5',
      },
    ];
    
    // In real app: return await _apiService.get('/users');
  }
}
