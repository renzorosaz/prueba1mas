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
      // initialRoute: SplashScreen,
      // routes: {
      //   '/': (BuildContext context) => SplashScreen(),
      //   // 'detalle': (BuildContext context) => PeliculaDetalle(),
      // },
    );
    // return FutureBuilder(
    //   future: Firebase.initializeApp(),
    //   builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
    //     if (snapshot.hasError) {
    //       return Container(child: Text("Error de firebase"));
    //     }

    //     // Once complete, show your application
    //     if (snapshot.connectionState == ConnectionState.done) {
    //       return SplashScreen();
    //     }

    //     // Otherwise, show something whilst waiting for initialization to complete
    //     return CircularProgressIndicator();
    //   },
    // );
  }
}
