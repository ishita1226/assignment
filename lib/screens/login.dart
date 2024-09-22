import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:lingopanda/screens/signup.dart';
import 'package:lingopanda/screens/home.dart';
import 'package:lingopanda/auth_provider.dart'; // Your custom AuthProvider




class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthServiceProvider>(context); // Access AuthProvider
    final double screenHeight = MediaQuery.of(context).size.height;
    final double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: const Color(0xFFF5F9FD), // Light background color
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
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
                    color: const Color(0xFF0C54BE), // Blue color
                    fontFamily: 'Poppins', // Custom font
                  ),
                ),
              ),
              SizedBox(height: screenHeight * 0.22), // Space between title and fields

              // Email Field
              TextField(
                controller: _emailController,
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.symmetric(vertical: 18, horizontal: 20),
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
                  contentPadding: const EdgeInsets.symmetric(vertical: 18, horizontal: 20),
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
              SizedBox(height: screenHeight * 0.02),

              // Show error message
              if (authProvider.errorMessage.isNotEmpty)
                Padding(
                  padding: EdgeInsets.only(bottom: screenHeight * 0.02),
                  child: Text(
                    authProvider.errorMessage,
                    style: TextStyle(color: Colors.red, fontSize: screenWidth * 0.04),
                  ),
                ),

              // Login Button
              SizedBox(
                width: double.infinity, // Full-width button
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(vertical: screenHeight * 0.02, horizontal: screenWidth * 0.3),
                    backgroundColor: const Color(0xFF0C54BE), // Blue color
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12), // Rounded button
                    ),
                  ),
                  onPressed: authProvider.isLoading
                      ? null // Disable button while loading
                      : () async {
                          final email = _emailController.text.trim();
                          final password = _passwordController.text.trim();

                          // Clear previous error message
                          authProvider.clearErrorMessage();

                          // Perform sign-in
                          User? user = await authProvider.signInWithEmailPassword(email, password);

                          if (user != null) {
                            // Navigate to another screen
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(builder: (context) => ProductScreen()),
                            );
                          }
                        },
                  child: authProvider.isLoading
                      ? const CircularProgressIndicator(color: Colors.white)
                      : Text(
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
                        color: const Color(0xFF0C54BE), // Blue text for signup
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
