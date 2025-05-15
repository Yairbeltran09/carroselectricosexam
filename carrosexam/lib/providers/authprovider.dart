import 'package:flutter/material.dart';
import '../services/api_services.dart';

class AuthProvider with ChangeNotifier {
  String? _token;
  bool _isAuthenticated = false;

  String? get token => _token;
  bool get isAuthenticated => _isAuthenticated;

  Future<bool> login(String username, String password) async {
    _token = await ApiService.login(username, password);
    _isAuthenticated = _token != null;
    notifyListeners();
    return _isAuthenticated;
  }

  void logout() {
    _token = null;
    _isAuthenticated = false;
    notifyListeners();
  }
}
