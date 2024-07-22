import 'package:dio/dio.dart';
import 'package:riverpoddemo/common/constant.dart';
import 'package:riverpoddemo/models/user_model.dart';

class ApiService {
  final Dio _dio = Dio(
    BaseOptions(
      baseUrl: ApiConstants.baseUrl,
      headers: {'Content-Type': 'application/json'},
    ),
  );

  Future<List<User>> fetchUsers(int page) async {
    final response = await _dio.get('${ApiConstants.usersEndpoint}?page=$page');
    if (response.statusCode == 200) {
      final List<dynamic> data = response.data['data'];
      return data.map((json) => User.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load users');
    }
  }

  Future<void> createUser(String name, String job) async {
    final response = await _dio.post(
      ApiConstants.usersEndpoint,
      data: {"name": name, "job": job},
    );
    if (response.statusCode != 201) {
      throw Exception('Failed to create user');
    }
  }
}
