import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:pruebamas1/src/splash_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // print(email);
  //await Firebase.initializeApp();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // late String email;

  @override
  Widget build(BuildContext context) {
    // print(email);
    return MaterialApp(
      theme: ThemeData(
          brightness: Brightness.light, primaryColor: Colors.brown[400]),
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  }
}
