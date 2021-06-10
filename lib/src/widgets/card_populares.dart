import 'package:flutter/material.dart';
import 'package:pruebamas1/models/popular_model.dart';
import 'package:pruebamas1/src/components/mediaquerys.dart';

class CardPopulares extends StatelessWidget {
  late List<PopularModel>? populares;

  CardPopulares({@required this.populares});
  @override
  Widget build(BuildContext context) {
    return Container(
      width: mediaWidth(context) * 0.8,
      height: mediaHigh(context) * 0.4,
      padding: EdgeInsets.only(top: 12.0),
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: populares!.length,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            width: 200,
            height: 200,
            child: Card(
              color: Colors.brown.withOpacity(0.3),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(populares![index].title,
                      style: TextStyle(color: Colors.white)),
                  SizedBox(
                    height: 20,
                  ),
                  Column(
                    children: [
                      Text("Year",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold)),
                      Text(populares![index].year.toString(),
                          style: TextStyle(color: Colors.white)),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
