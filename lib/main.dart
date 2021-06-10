import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:pruebamas1/src/splash_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  //await Firebase.initializeApp();
  //TODO: por más que inicialice, no recupera la bd de firestore bloqueante
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          brightness: Brightness.light, primaryColor: Colors.brown[400]),
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  }
}
