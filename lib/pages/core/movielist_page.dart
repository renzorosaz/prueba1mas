import 'package:flutter/material.dart';
import 'package:pruebamas1/models/movie_model.dart';
import 'package:pruebamas1/models/popular_model.dart';
import 'package:pruebamas1/providers/movies_provider.dart';
import 'package:pruebamas1/src/widgets/card_peliculas.dart';
import 'package:pruebamas1/src/widgets/card_populares.dart';

class MovieListPage extends StatefulWidget {
  @override
  _MovieListPageState createState() => _MovieListPageState();
}

class _MovieListPageState extends State<MovieListPage> {
  final peliculasProvider = new PeliculasProvider();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors: [
              Colors.black,
              Colors.black38,
            ],
          ),
        ),
        padding: EdgeInsets.only(top: 50),
        child: Column(
          children: <Widget>[
            Text("Películas", style: TextStyle(color: Colors.white)),
            _swiperPeliculas(),
            SizedBox(height: 20),
            Text("Populares", style: TextStyle(color: Colors.white)),
            _swiperPopupales(),
          ],
        ),
      ),
    );
  }

  Widget _swiperPeliculas() {
    return FutureBuilder(
      future: peliculasProvider.getPeliculas(),
      builder: (BuildContext context, AsyncSnapshot<List<Pelicula>> snapshot) {
        if (snapshot.hasData) {
          //return Text("");
          return CardPeliculas(peliculas: snapshot.data);
        } else {
          return Container(
              height: 400.0, child: Center(child: CircularProgressIndicator()));
        }
      },
    );
  }

  Widget _swiperPopupales() {
    return FutureBuilder(
      future: peliculasProvider.getPopulares(),
      builder:
          (BuildContext context, AsyncSnapshot<List<PopularModel>> snapshot) {
        if (snapshot.hasData) {
          return CardPopulares(populares: snapshot.data);
          // return CardSwiper(peliculas: snapshot.data);
        } else {
          return Container(
              height: 400.0, child: Center(child: CircularProgressIndicator()));
        }
      },
    );
  }
}
