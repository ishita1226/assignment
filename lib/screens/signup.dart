import 'package:flutter/material.dart';
import 'package:lingopanda/firebase_new.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:lingopanda/screens/home.dart';
import 'package:provider/provider.dart';
import 'package:lingopanda/screens/login.dart'; // Assuming login screen is located here

class SignupPage extends StatefulWidget {
  @override
  _SignupPageState createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final AuthService _authService = AuthService();

  @override
  Widget build(BuildContext context) {
    // Fetching screen dimensions for responsiveness
    final double screenHeight = MediaQuery.of(context).size.height;
    final double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Color(0xFFF5F9FD), // Adjusted to a light background similar to the image
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: screenHeight * 0.05), // Spacing from the top
                Text(
                  'e-Shop',
                  style: TextStyle(
                    fontSize: screenWidth * 0.08, // Slightly larger title
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF0C54BE),
                    fontFamily: 'Poppins',
                  ),
                ),
                SizedBox(height: screenHeight * 0.12), // Increased space between title and form

                // Name Field
                TextField(
                  controller: _nameController,
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.symmetric(vertical: 18, horizontal: 20), // Subtle padding
                    labelText: 'Name',
                    labelStyle: TextStyle(
                      fontSize: screenWidth * 0.045, // Responsive label size
                      color: Colors.black87,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12), // Reduced rounding for a more rectangular look
                      borderSide: BorderSide(color: Colors.white, width: 1), // Thinner, light border
                    ),
                    filled: true,
                    fillColor: Colors.white,
                  ),
                ),
                SizedBox(height: screenHeight * 0.025), // Slightly reduced spacing
                
                // Email Field
                TextField(
                  controller: _emailController,
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.symmetric(vertical: 18, horizontal: 20), // Subtle padding
                    labelText: 'Email',
                    labelStyle: TextStyle(
                      fontSize: screenWidth * 0.045,
                      color: Colors.black87,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide(color: Colors.white, width: 1), // Thinner, light border
                    ),
                    filled: true,
                    fillColor: Colors.white,
                  ),
                ),
                SizedBox(height: screenHeight * 0.025), // Spacing between fields
                
                // Password Field
                TextField(
                  controller: _passwordController,
                  obscureText: true,
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.symmetric(vertical: 18, horizontal: 20), // Subtle padding
                    labelText: 'Password',
                    labelStyle: TextStyle(
                      fontSize: screenWidth * 0.045,
                      color: Colors.black87,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12), // Reduced rounding for a more rectangular look
                      borderSide: BorderSide(color: Colors.white, width: 1), // Thinner, light border
                    ),
                    filled: true,
                    fillColor: Colors.white,
                  ),
                ),
                SizedBox(height: screenHeight * 0.3), // Increased spacing before button
                
                // Signup Button
                Consumer<AuthService>(
                  builder: (context, authService, child) {
                    return Center(
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          padding: EdgeInsets.symmetric(
                            vertical: screenHeight * 0.02,
                            horizontal: screenWidth * 0.3,
                          ),
                          backgroundColor: Color(0xFF0C54BE), // Blue color code #0C54BE
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12), // Matching button radius with text field
                          ),
                        ),
                        onPressed: () async {
                          final name = _nameController.text.trim();
                          final email = _emailController.text.trim();
                          final password = _passwordController.text.trim();
                          User? user = await authService.signUpWithEmailPassword(email, password);
                          if (user != null) {
                            // Navigate to another screen
                            Navigator.push(context, MaterialPageRoute(builder: (context) => ProductScreen()));
                            print('Signed up successfully');
                          } else {
                            print('Failed to sign up');
                          }
                        },
                        child: Text(
                          'Signup',
                          style: TextStyle(
                            fontSize: screenWidth * 0.045,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    );
                  },
                ),
                SizedBox(height: screenHeight * 0.009), // Adjusted spacing for better layout
                
                // Login Text Button
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Already have an account? '),
                    TextButton(
                      onPressed: () {
                        // Navigate to the Login page
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(builder: (context) => LoginPage()),
                        );
                      },
                      child: Text(
                        'Login',
                        style: TextStyle(
                          color: Color(0xFF0C54BE), // Blue color
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
