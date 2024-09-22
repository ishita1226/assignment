import 'package:flutter/material.dart';
import 'package:lingopanda/screens/signup.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';
import 'package:lingopanda/firebase_new.dart'; // Assuming AuthService is located here

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<AuthService>(create: (_) => AuthService()), // No ChangeNotifier
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: SignupPage(),
      ),
    );
  }
}


// import 'package:flutter/material.dart';
// import 'package:lingopanda/screens/login.dart';
// import 'package:provider/provider.dart';
// import 'package:lingopanda/auth_provider.dart';

// void main() {
//   runApp(
//     MultiProvider(
//       providers: [
//         ChangeNotifierProvider(create: (_) => AuthProvider()), // Provide AuthProvider
//       ],
//       child: MyApp(),
//     ),
//   );
// }

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: LoginPage(), // Your LoginPage
//     );
//   }
// }
