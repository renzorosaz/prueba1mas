import 'dart:ui';

import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:pruebamas1/pages/home_page.dart';
import 'package:pruebamas1/src/components/mediaquerys.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  //VARIABLES
  String? nombreGoogle;
  String? correoEleGoogle;
  String? fotoUrl;
  bool _isLoggedIn = true;

  final fb = FirebaseDatabase.instance;

  final name = "Name";

  GoogleSignIn _googleSignIn = GoogleSignIn(scopes: ['email']);

  //MÉTODOS

  _loginGoogle() async {
    try {
      await _googleSignIn.signIn();
      if (_googleSignIn.currentUser != null) {
        _isLoggedIn = false;
        SharedPreferences prefs = await SharedPreferences.getInstance();

        prefs.setString('email', "${_googleSignIn.currentUser?.email}");
        prefs.setString('nombre', "${_googleSignIn.currentUser?.displayName}");
        prefs.setString('foto', "${_googleSignIn.currentUser?.photoUrl}");

        await Navigator.pushReplacement(
            context,
            MaterialPageRoute(
                builder: (context) => HomePage(
                    nombreUsuario: _googleSignIn.currentUser?.displayName,
                    correoEleGoogle: _googleSignIn.currentUser?.email,
                    fotoUrl: _googleSignIn.currentUser?.photoUrl)));
      } else {
        setState(() {
          _isLoggedIn = false;
        });
      }
    } catch (err) {
      print(err);
    }
  }

  @override
  Widget build(BuildContext context) {
    final ref = fb.reference();

    return Scaffold(
      body: Stack(
        children: [
          Container(
            width: mediaWidth(context) * 1,
            height: mediaHigh(context) * 1,
            decoration: BoxDecoration(
              image: DecorationImage(
                image:
                    NetworkImage("https://wallpapercave.com/wp/wp5483697.jpg"),
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
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                    child: Text("Ingresar",
                        style: TextStyle(color: Colors.white, fontSize: 24))),
                SizedBox(height: 20),
                Container(
                    width: 261,
                    height: 38,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10)),
                    child: OutlinedButton(
                        child: Row(
                          children: [
                            Image.asset("assets/icongo.png"),
                            SizedBox(
                              width: 25,
                            ),
                            Text("Ingresar con Google",
                                style: TextStyle(
                                    color: Colors.blue[400],
                                    fontWeight: FontWeight.w500)),
                          ],
                        ),
                        onPressed: () {
                          _loginGoogle();
                          //ref.child(name).set("renxito 1");
                        }))
              ],
            ),
          )
        ],
      ),
    );
  }
}
