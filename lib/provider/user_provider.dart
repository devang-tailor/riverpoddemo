import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpoddemo/models/user_model.dart';
import 'package:riverpoddemo/services/api_service.dart';
import 'package:riverpoddemo/viewmodels/user_viewmodel.dart';


final apiServiceProvider = Provider<ApiService>((ref) => ApiService());

final userViewModelProvider = StateNotifierProvider<UserViewModel, List<User>>((ref) {
  final apiService = ref.read(apiServiceProvider);
  return UserViewModel(apiService);
});
