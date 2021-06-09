import 'package:flutter/material.dart';
import 'package:pruebamas1/pages/core/movielist_page.dart';
import 'package:pruebamas1/pages/core/profile_page.dart';
import 'package:pruebamas1/src/components/mediaquerys.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomePage extends StatefulWidget {
  final String? nombreUsuario;
  final String? correoEleGoogle;
  final String? fotoUrl;

  HomePage({this.nombreUsuario, this.correoEleGoogle, this.fotoUrl});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;

  PageController _pageController = PageController(
    initialPage: 0,
  );

  @override
  void initState() {
    super.initState();
  }

  void _onItemTapped(int index) {
    setState(() {
      _currentIndex = index;
      _pageController.animateToPage(index,
          duration: Duration(milliseconds: 500), curve: Curves.ease);
      print(index);
    });
  }

  List<Widget> _children = [
    MovieListPage(),
    ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
          physics: new NeverScrollableScrollPhysics(),
          controller: _pageController,
          onPageChanged: (index) {
            setState(() {
              _currentIndex = index;
            });
          },
          children: <Widget>[
            MovieListPage(),
            ProfilePage(
                nombreUsuario: widget.nombreUsuario,
                email: widget.correoEleGoogle,
                foto: widget.fotoUrl),
          ]),
      bottomNavigationBar: _createBottomNavigationBar(),
    );
  }

  Widget _createBottomNavigationBar() {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(15.0), topRight: Radius.circular(15.0)),
          color: Colors.brown[400]),
      child: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: _onItemTapped,
        showUnselectedLabels: true,
        selectedLabelStyle:
            TextStyle(color: Colors.white, fontWeight: FontWeight.w800),
        fixedColor: Colors.white,
        backgroundColor: Colors.transparent,
        type: BottomNavigationBarType.fixed,
        elevation: 0,
        unselectedItemColor: Colors.white,
        selectedIconTheme: IconThemeData(color: Colors.white),
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.movie),
            label: "My Movies",
            backgroundColor: Theme.of(context).primaryColor,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: "Perfíl",
            backgroundColor: Theme.of(context).primaryColor,
          ),
        ],
      ),
    );
  }
}
