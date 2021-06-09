import 'dart:math' as math;
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:pruebamas1/pages/home_page.dart';
import 'package:pruebamas1/pages/login_page.dart';
import 'package:pruebamas1/src/components/mediaquerys.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AnimationLoadingPage extends StatefulWidget {
  String? email;
  AnimationLoadingPage({this.email});
  @override
  _AnimationLoadingPageState createState() => _AnimationLoadingPageState();
}

class _AnimationLoadingPageState extends State<AnimationLoadingPage>
    with SingleTickerProviderStateMixin {
  final int numberOfActors = 4;
  final double initialOffset = 0.0;
  final double finalOffset = 0.7;
  late AnimationController _loadingAnimationController;

  @override
  void initState() {
    super.initState();
    _initLoadingAnimationController();
    _loadingAnimationController.forward();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _initLoadingAnimationController();
    super.dispose();
  }

  void _initLoadingAnimationController() async {
    // var nombreUsuario = prefs.getString('nombre');
    // var foto = prefs.getString('foto');

    _loadingAnimationController = AnimationController(
      vsync: this,
      duration: Duration(seconds: 8),
    )..addStatusListener((AnimationStatus status) async {
        if (status == AnimationStatus.completed) {
          _loadingAnimationController.forward(from: 0);
          SharedPreferences prefs = await SharedPreferences.getInstance();

          var email = prefs.getString('email');

          if (email == null) {
            Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (context) => LoginPage()),
                (Route<dynamic> route) => false);
          } else if (email != "") {
            Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (context) => HomePage()),
                (Route<dynamic> route) => false);
          }
        }
      });
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

  Widget _loadingText() {
    Animation animation = _textAnimation();
    return AnimatedBuilder(
        // You should create a separate animation
        animation: animation,
        builder: (context, child) {
          return Container(
              width: mediaWidth(context) * 1,
              height: mediaHigh(context) * 1,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(
                      "https://wallpapercave.com/wp/wp5483697.jpg"),
                  fit: BoxFit.cover,
                ),
              ));
        });
  }

  Animation<double> _initLoadingAnimation(int index) {
    double lastActorStartTime = 0.3;
    double actorAnimationDuration = 0.4;
    double begin = lastActorStartTime * (index / numberOfActors);
    double end = actorAnimationDuration + begin;
    // Using Tween doesnt give us the desired output so we create a
    // custom Animatable
    // return Tween(begin: initialOffset, end: finalOffset)
    return Sinusoid(min: initialOffset, max: finalOffset).animate(
      CurvedAnimation(
        parent: _loadingAnimationController,
        curve: Interval(begin, end, curve: Curves.easeIn),
      ),
    );
  }

  Animation<double> _textAnimation() {
    return Sinusoid(min: initialOffset, max: finalOffset).animate(
      CurvedAnimation(
        parent: _loadingAnimationController,
        curve: Curves.ease,
      ),
    );
  }
}

class Sinusoid extends Animatable<double> {
  final double min;
  final double max;

  Sinusoid({required this.min, required this.max});

  @override
  double transform(double t) {
    return min + (max - min) * math.sin(math.pi * t);
  }
}
