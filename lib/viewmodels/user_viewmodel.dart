import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpoddemo/models/user_model.dart';
import 'package:riverpoddemo/services/api_service.dart';


class UserViewModel extends StateNotifier<List<User>> {
  UserViewModel(this._apiService) : super([]);

  final ApiService _apiService;

  Future<void> loadUsers(int page) async {
    try {
      final users = await _apiService.fetchUsers(page);
      state = [...state, ...users];
    } catch (e) {
      // Handle error
    }
  }

  Future<void> addUser(String name, String job) async {
    try {
      await _apiService.createUser(name, job);
      // Optionally reload users
      state = [];
      await loadUsers(1);
    } catch (e) {
      // Handle error
    }
  }
}
