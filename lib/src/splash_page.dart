import 'dart:async';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:pruebamas1/pages/home_page.dart';
import 'package:pruebamas1/pages/login_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'components/mediaquerys.dart';

class SplashScreen extends StatefulWidget {
  final Color backgroundColor = Colors.white;
  final TextStyle styleTextUnderTheLoader = TextStyle(
      fontSize: 18.0, fontWeight: FontWeight.bold, color: Colors.black);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  String _versionName = 'V1.0';
  final splashDelay = 5;

  String? nombreUsuario;
  String? email;
  String? foto;

  @override
  void initState() {
    super.initState();
    cargarPref();
    _loadWidget();
  }

  void cargarPref() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var recuemail = prefs.getString('email');
    var recunombreUsuario = prefs.getString('nombre');
    var recufoto = prefs.getString('foto');

    nombreUsuario = recunombreUsuario;
    foto = recufoto;
    email = recuemail;

    print(nombreUsuario);
    print(foto);
    print(email);
  }

  _loadWidget() async {
    var _duration = Duration(seconds: splashDelay);
    return Timer(_duration, navigationPage);
  }

  void navigationPage() {
    nombreUsuario == null
        ? Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (BuildContext context) => LoginPage()))
        : Navigator.pushReplacement(
            context,
            MaterialPageRoute(
                builder: (BuildContext context) => HomePage(
                      nombreUsuario: nombreUsuario,
                      correoEleGoogle: email,
                      fotoUrl: foto,
                    )));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Stack(children: [
        Container(
          width: mediaWidth(context) * 1,
          height: mediaHigh(context) * 1,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: NetworkImage("https://wallpapercave.com/wp/wp5483697.jpg"),
              fit: BoxFit.cover,
            ),
          ),
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 1.5, sigmaY: 1.5),
            child: Container(
              color: Colors.black.withOpacity(0.5),
            ),
          ),
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Text("My Movies",
                  style: TextStyle(
                    fontSize: 30,
                    color: Colors.white,
                  )),
            ),
            SizedBox(height: 16),
            CircularProgressIndicator(
              color: Colors.red,
            )
          ],
        ),
      ])
          // child: Container(
          //   width: 200,
          //   height: 250,
          //   child: Column(
          //     children: <Widget>[
          //       //_loadingText(),
          //     ],
          //   ),
          // ),
          ),
    );
  }
}
