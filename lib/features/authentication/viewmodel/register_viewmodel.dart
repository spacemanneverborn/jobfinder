import 'package:flutter/material.dart';
import 'package:jobfinder/core/services/auth_service.dart';

class RegisterViewModel extends ChangeNotifier {
  final AuthService _authService = AuthService();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  String errorMessage = '';

  Future<void> register(BuildContext context) async {
    final email = emailController.text.trim();
    final password = passwordController.text.trim();
    if (email.isEmpty || password.isEmpty) {
      errorMessage = 'Please fill in all fields';
      notifyListeners();
      return;
    }
    final user = await _authService.register(email, password);
    if (user != null) {
      // Navigate to home screen
      Navigator.pushReplacementNamed(context, '/home');
    } else {
      errorMessage = 'Registration failed. Please try again.';
      notifyListeners();
    }
  }
}