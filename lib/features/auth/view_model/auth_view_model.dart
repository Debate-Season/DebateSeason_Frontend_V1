import 'package:flutter/material.dart';
import 'package:debateseason_frontend_v1/data/repositories/auth_repository.dart';

class AuthViewModel extends ChangeNotifier {
  final AuthRepository _authRepository;
  bool _isLoading = false;

  AuthViewModel(this._authRepository);

  bool get isLoading => _isLoading;

  Future<bool> login(String username, String password) async {
    _isLoading = true;
    notifyListeners();
    try {
      final success = await _authRepository.login(username, password);
      return success;
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
