import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:pruebamas1/pages/login_page.dart';
import 'package:pruebamas1/src/components/mediaquerys.dart';
import 'package:pruebamas1/src/splash_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfilePage extends StatefulWidget {
  String? nombreUsuario;
  String? email;
  String? foto;

  ProfilePage({this.nombreUsuario, this.email, this.foto});
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  // consultar preferencias y cargar a

  GoogleSignIn _googleSignIn = GoogleSignIn(scopes: ['email']);

  @override
  void initState() {
    super.initState();
  }

  void _cerrarSesion() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove('email');
    prefs.remove('nombre');
    prefs.remove('foto');
    await _googleSignIn.signOut();
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (BuildContext ctx) => SplashScreen()),
      (Route<dynamic> route) => false,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: mediaWidth(context) * 0.40,
              height: mediaHigh(context) * 0.22,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(15.0),
                    topRight: Radius.circular(15.0),
                    bottomRight: Radius.circular(15.0),
                    bottomLeft: Radius.circular(15.0)),
                image: DecorationImage(
                    //image: AssetImage(urlImagenUsuario),
                    image: NetworkImage(widget.foto.toString()),
                    fit: BoxFit.fill),
              ),
            ),
            SizedBox(height: 20),
            Container(
              width: 261,
              height: 38,
              padding: EdgeInsets.only(left: 5, right: 5),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: Colors.brown[200],
                borderRadius: BorderRadius.circular(10),
              ),
              child: TextFormField(
                  initialValue: widget.nombreUsuario,
                  //limitar caracteres
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: "Nombre",
                  )),
            ),
            SizedBox(height: 20),
            // Container(
            //   width: 261,
            //   height: 38,
            //   padding: EdgeInsets.only(left: 5, right: 5),
            //   alignment: Alignment.center,
            //   decoration: BoxDecoration(
            //     color: Colors.brown[200],
            //     borderRadius: BorderRadius.circular(10),
            //   ),
            //   child: TextFormField(
            //       //initialValue: widget.nombreUsuario,
            //       //limitar caracteres
            //       decoration: InputDecoration(
            //     border: InputBorder.none,
            //     hintText: "Apellido",
            //   )),
            // ),
            SizedBox(height: 20),
            Container(
              width: 261,
              height: 38,
              padding: EdgeInsets.only(left: 5, right: 5),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: Colors.brown[200],
                borderRadius: BorderRadius.circular(10),
              ),
              child: TextFormField(
                  initialValue: widget.email,
                  //limitar caracteres
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: "Email",
                  )),
            ),
            SizedBox(height: 30),
            ElevatedButton(
                child: Text("Actualizar"),
                onPressed: () {
                  // editar campos
                  //implementar metodo que registre en firebase databases LOS REGISTRO Y ACTUALIZACIONES
                }),
            SizedBox(height: 50),
            ElevatedButton(
                child: Text("Cerrar Sesión"),
                onPressed: () {
                  _cerrarSesion();
                  // editar campos
                  //implementar metodo que registre en firebase databases LOS REGISTRO Y ACTUALIZACIONES
                })
          ],
        ),
      ),
    );
  }
}
