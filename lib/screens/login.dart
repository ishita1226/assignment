import 'package:flutter/material.dart';
import 'package:lingopanda/firebase_new.dart';
import 'package:lingopanda/screens/signup.dart';
import 'package:firebase_auth/firebase_auth.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final AuthService _authService = AuthService();

  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;
    final double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Color(0xFFF5F9FD), // Light background color
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.center, // Center the content vertically
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Title
              SizedBox(height: screenHeight * 0.05),
              Align(
                alignment: Alignment.topLeft,
                child: Text(
                  'e-Shop',
                  style: TextStyle(
                    fontSize: screenWidth * 0.08, // Responsive font size
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF0C54BE), // Blue color
                    fontFamily: 'Poppins', // Custom font
                  ),
                ),
              ),
              SizedBox(height: screenHeight * 0.2), // Space between title and fields

              // Email Field
              TextField(
                controller: _emailController,
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.symmetric(vertical: 18, horizontal: 20),
                  labelText: 'Email',
                  labelStyle: TextStyle(
                    fontSize: screenWidth * 0.045, // Adjust font size for responsiveness
                    color: Colors.black87,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12), // Rounded corners
                    borderSide: BorderSide(color: Colors.grey.shade300, width: 1), // Light border
                  ),
                  filled: true,
                  fillColor: Colors.white,
                ),
              ),
              SizedBox(height: screenHeight * 0.03), // Space between fields

              // Password Field
              TextField(
                controller: _passwordController,
                obscureText: true, // Hide password input
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.symmetric(vertical: 18, horizontal: 20),
                  labelText: 'Password',
                  labelStyle: TextStyle(
                    fontSize: screenWidth * 0.045, // Adjust font size for responsiveness
                    color: Colors.black87,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(color: Colors.grey.shade300, width: 1), // Light border
                  ),
                  filled: true,
                  fillColor: Colors.white,
                ),
              ),
              SizedBox(height: screenHeight * 0.3), // Space before login button

              // Login Button
              SizedBox(
                width: double.infinity, // Full-width button
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(vertical: screenHeight * 0.02, horizontal: screenWidth * 0.3),
                    backgroundColor: Color(0xFF0C54BE), // Blue color
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12), // Rounded button
                    ),
                  ),
                  onPressed: () async {
                    final email = _emailController.text.trim();
                    final password = _passwordController.text.trim();
                    User? user = await _authService.signInWithEmailPassword(email, password);
                    if (user != null) {
                      // Navigate to another screen
                      print('Logged in successfully');
                    } else {
                      print('Failed to log in');
                    }
                  },
                  child: Text(
                    'Login',
                    style: TextStyle(
                      fontSize: screenWidth * 0.045,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              SizedBox(height: screenHeight * 0.02), // Space between button and sign-up text

              // Sign-up Option
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'New here? ',
                    style: TextStyle(
                      fontSize: screenWidth * 0.04,
                      color: Colors.black87,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => SignupPage()));
                    },
                    child: Text(
                      'Signup',
                      style: TextStyle(
                        fontSize: screenWidth * 0.04,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF0C54BE), // Blue text for signup
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
