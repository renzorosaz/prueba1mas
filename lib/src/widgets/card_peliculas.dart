import 'package:flutter/material.dart';

import 'package:pruebamas1/models/movie_model.dart';
import 'package:pruebamas1/pages/core/pelicula_detalle.dart';
import 'package:pruebamas1/src/components/mediaquerys.dart';

class CardPeliculas extends StatelessWidget {
  late List<Pelicula>? peliculas;

  CardPeliculas({@required this.peliculas});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: mediaWidth(context) * 0.8,
      height: mediaHigh(context) * 0.4,
      padding: EdgeInsets.only(top: 12.0),
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: peliculas!.length,
        itemBuilder: (BuildContext context, int index) {
          peliculas![index].uniqueId = '${peliculas![index].id}-tarjeta';
          return Container(
            width: 200,
            height: 200,
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            PeliculaDetalle(peliculaModel: peliculas![index])));
              },
              child: Card(
                color: Colors.brown.withOpacity(0.3),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(peliculas![index].title,
                        style: TextStyle(color: Colors.white)),
                    SizedBox(
                      height: 20,
                    ),
                    Column(
                      children: [
                        Text("# Watchers:  ",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold)),
                        Text(peliculas![index].popularity.toString(),
                            style: TextStyle(color: Colors.white)),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
