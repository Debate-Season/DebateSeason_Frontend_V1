import 'package:debateseason_frontend_v1/features/auth/data/repositories_impl/auth_repository.dart';
import 'package:flutter/material.dart';

class AuthViewModel extends ChangeNotifier {
  final AuthRepository _authRepository;
  bool _isLoading = false;
  bool _isLoggedIn = false;

  AuthViewModel(this._authRepository);

  bool get isLoggedIn => _isLoggedIn;
  bool get isLoading => _isLoading;

  Future<bool> login(String username, String password) async {
    try {
      _isLoading = true;
      notifyListeners();

      final success = await _authRepository.login(username, password);

      if (success) {
        _isLoggedIn = true;
      } else {
        _isLoggedIn = false;
      }

      return success;
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
