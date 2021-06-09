import 'package:flutter/material.dart';
import 'package:pruebamas1/pages/core/pelicula_detalle.dart';
import 'package:pruebamas1/pages/home_page.dart';
import 'package:pruebamas1/src/splash_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // print(email);
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
      // initialRoute: SplashScreen,
      // routes: {
      //   '/': (BuildContext context) => SplashScreen(),
      //   // 'detalle': (BuildContext context) => PeliculaDetalle(),
      // },
    );
  }
}
