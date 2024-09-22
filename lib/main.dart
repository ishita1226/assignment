import 'package:flutter/material.dart';
import 'package:lingopanda/product_provider.dart';
import 'package:lingopanda/screens/home.dart';
import 'package:provider/provider.dart';
import 'package:lingopanda/auth_provider.dart'; // Import AuthProvider
import 'package:lingopanda/screens/login.dart'; // Your login page
import 'package:firebase_core/firebase_core.dart'; // Import Firebase

void main() async {
  WidgetsFlutterBinding.ensureInitialized(); // Ensures binding is initialized
  await Firebase.initializeApp(); // Initialize Firebase
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AuthServiceProvider()),
        ChangeNotifierProvider(create: (_) => ProductProvider()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<AuthServiceProvider>(
      builder: (context, authService, _) {
        if (authService.user != null) {
          return const MaterialApp(
            home: ProductScreen(), // Redirect to your home page
            debugShowCheckedModeBanner: false,
          );
        } else {
          return const MaterialApp(
            home: LoginPage(), // Show the login page if not authenticated
            debugShowCheckedModeBanner: false,
          );
        }
      },
    );
  }
}
