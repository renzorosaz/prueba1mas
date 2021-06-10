// To parse this JSON data, do
//
//     final popularModel = popularModelFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

PopularModel popularModelFromJson(String str) =>
    PopularModel.fromJson(json.decode(str));

String popularModelToJson(PopularModel data) => json.encode(data.toJson());

class PopularModel {
  PopularModel({
    required this.title,
    required this.year,
    required this.ids,
  });

  final String title;
  final int year;
  final Ids ids;

  factory PopularModel.fromJson(Map<String, dynamic> json) => PopularModel(
        title: json["title"],
        year: json["year"],
        ids: Ids.fromJson(json["ids"]),
      );

  Map<String, dynamic> toJson() => {
        "title": title,
        "year": year,
        "ids": ids.toJson(),
      };
}

class Ids {
  Ids({
    required this.trakt,
    required this.slug,
    required this.imdb,
    required this.tmdb,
  });

  final int trakt;
  final String slug;
  final String imdb;
  final int tmdb;

  factory Ids.fromJson(Map<String, dynamic> json) => Ids(
        trakt: json["trakt"],
        slug: json["slug"],
        imdb: json["imdb"],
        tmdb: json["tmdb"],
      );

  Map<String, dynamic> toJson() => {
        "trakt": trakt,
        "slug": slug,
        "imdb": imdb,
        "tmdb": tmdb,
      };
}
