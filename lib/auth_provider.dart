import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';


class AuthServiceProvider with ChangeNotifier {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  User? _user;
  bool _isLoading = false;
  String _errorMessage = '';

  User? get user => _user;
  bool get isLoading => _isLoading;
  String get errorMessage => _errorMessage;

  AuthServiceProvider() {
    // Listen to authentication state changes
    _firebaseAuth.authStateChanges().listen(_onAuthStateChanged);
  }

  Future<void> _onAuthStateChanged(User? user) async {
    _user = user;
    notifyListeners();
  }

  // Clear error message
  void clearErrorMessage() {
    _errorMessage = '';
    notifyListeners();
  }

  // Sign In with email and password
  Future<User?> signInWithEmailPassword(String email, String password) async {
    _isLoading = true;
    notifyListeners();

    try {
      UserCredential userCredential =
          await _firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      _isLoading = false;
      notifyListeners();
      return userCredential.user;
    } on FirebaseAuthException catch (e) {
      _isLoading = false;
      _errorMessage = _getErrorMessage(e);
      notifyListeners();
      return null;
    }
  }

  // Sign Up with email and password
  Future<User?> signUpWithEmailPassword(String email, String password, String name) async {
  try {
    _isLoading = true;
    notifyListeners();  // Show loading indicator
    
    // Create user with email and password
    UserCredential userCredential = await _firebaseAuth.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );
    User? user = userCredential.user;

    // Check if the user is not null
    if (user != null) {
      // Store additional user information in Firestore
      await FirebaseFirestore.instance.collection('users').doc(user.uid).set({
        'name': name,
        'email': email,
        'createdAt': FieldValue.serverTimestamp(),
      });

      _isLoading = false;
      notifyListeners();  // Hide loading indicator

      return user;
    }
  } on FirebaseAuthException catch (e) {
    _errorMessage = e.message ?? 'An unknown error occurred';
    _isLoading = false;
    notifyListeners();  // Hide loading indicator
    return null;
  } finally {
    _isLoading = false;
    notifyListeners();  // Ensure loading indicator is hidden
  }
  return null;
}


  // Sign Out
  Future<void> signOut() async {
    await _firebaseAuth.signOut();
  }

  // Helper method to map FirebaseAuthException codes to user-friendly messages
  String _getErrorMessage(FirebaseAuthException e) {
    switch (e.code) {
      case 'user-not-found':
        return 'No user found with this email.';
      case 'wrong-password':
        return 'Incorrect password.';
      case 'email-already-in-use':
        return 'This email is already registered.';
      case 'weak-password':
        return 'The password is too weak.';
      case 'invalid-email':
        return 'The email address is invalid.';
      default:
        return 'An unknown error occurred.';
    }
  }
}
