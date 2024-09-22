import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:lingopanda/firebase_new.dart'; // Your AuthService class

class AuthServiceProvider with ChangeNotifier {
  final AuthService _authService = AuthService();

  // State variables
  bool _isLoading = false;
  String _errorMessage = '';

  // Getters for the state variables
  bool get isLoading => _isLoading;
  String get errorMessage => _errorMessage;

  // Clear error message
  void clearErrorMessage() {
    _errorMessage = '';
    notifyListeners();
  }

  // Method for signing in
  Future<User?> signInWithEmailPassword(String email, String password) async {
    try {
      _isLoading = true;
      notifyListeners(); // Update the state to show loading
      User? user = await _authService.signInWithEmailPassword(email, password);
      _isLoading = false;
      notifyListeners(); // Update the state after loading completes
      return user;
    } catch (e) {
      _errorMessage = e.toString(); // Capture error message
      _isLoading = false;
      notifyListeners();
      return null;
    }
  }
}
