import 'package:flutter/material.dart';
import 'package:like_button/like_button.dart';
import 'package:pruebamas1/models/movie_model.dart';

class PeliculaDetalle extends StatefulWidget {
  Pelicula peliculaModel;

  PeliculaDetalle({required this.peliculaModel});
  @override
  _PeliculaDetalleState createState() => _PeliculaDetalleState();
}

class _PeliculaDetalleState extends State<PeliculaDetalle> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text(widget.peliculaModel.title)),
        body: Container(
            child: Column(
          children: [
            SizedBox(
              height: 20,
            ),
            _posterTitulo(context, widget.peliculaModel),
            _descripcion(widget.peliculaModel),
            _crearLikesButons(),
          ],
        )));
  }

  Widget _posterTitulo(BuildContext context, Pelicula pelicula) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.0),
      child: Row(
        children: <Widget>[
          Hero(
            tag: pelicula.uniqueId.toString,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20.0),
              child: Image(
                image: NetworkImage(pelicula.getPosterImg()),
                height: 150.0,
              ),
            ),
          ),
          SizedBox(width: 20.0),
          Flexible(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(pelicula.title,
                    style: Theme.of(context).textTheme.headline6,
                    overflow: TextOverflow.ellipsis),
                Text(pelicula.originalTitle,
                    style: Theme.of(context).textTheme.headline6,
                    overflow: TextOverflow.ellipsis),
                Row(
                  children: <Widget>[
                    Icon(Icons.star_border),
                    Text(pelicula.voteAverage.toString(),
                        style: Theme.of(context).textTheme.headline6)
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _descripcion(Pelicula pelicula) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
      child: Text(
        pelicula.overview.toString(),
        textAlign: TextAlign.justify,
      ),
    );
  }
}

Future<bool> onLikeButtonTapped(bool isLiked) async {
  print(isLiked);
  return !isLiked;
}

Widget _crearLikesButons() {
  return Container(
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        LikeButton(
          onTap: onLikeButtonTapped,
          size: 30,
          circleColor:
              CircleColor(start: Color(0xff00ddff), end: Color(0xff0099cc)),
          bubblesColor: BubblesColor(
            dotPrimaryColor: Color(0xff33b5e5),
            dotSecondaryColor: Color(0xff0099cc),
          ),
          likeBuilder: (bool isLiked) {
            return Icon(
              Icons.favorite,
              color: isLiked ? Colors.brown : Colors.grey,
              size: 20,
            );
          },
          likeCount: 665,
        ),
        LikeButton(
          onTap: onLikeButtonTapped,
          size: 30,
          circleColor:
              CircleColor(start: Color(0xff00ddff), end: Color(0xff0099cc)),
          bubblesColor: BubblesColor(
            dotPrimaryColor: Color(0xff33b5e5),
            dotSecondaryColor: Color(0xff0099cc),
          ),
          likeBuilder: (bool isLiked2) {
            return Icon(
              Icons.headphones_rounded,
              color: isLiked2 ? Colors.brown : Colors.grey,
              size: 20,
            );
          },
          likeCount: 665,
        ),
        LikeButton(
          onTap: onLikeButtonTapped,
          size: 30,
          circleColor:
              CircleColor(start: Color(0xff00ddff), end: Color(0xff0099cc)),
          bubblesColor: BubblesColor(
            dotPrimaryColor: Color(0xff33b5e5),
            dotSecondaryColor: Color(0xff0099cc),
          ),
          likeBuilder: (bool isLiked3) {
            return Icon(
              Icons.alarm_add_rounded,
              color: isLiked3 ? Colors.brown : Colors.grey,
              size: 20,
            );
          },
          likeCount: 665,
        ),
      ],
    ),
  );
}
