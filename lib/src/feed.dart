// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'dart:convert';

Welcome welcomeFromJson(String str) => Welcome.fromJson(json.decode(str));

String welcomeToJson(Welcome data) => json.encode(data.toJson());

class Welcome {
  List<Movie> movies;

  Welcome({
    required this.movies,
  });

  factory Welcome.fromJson(Map<String, dynamic> json) => Welcome(
        movies: List<Movie>.from(json["movies"].map((x) => Movie.fromJson(x))),
      );

  get length => 130;

  Map<String, dynamic> toJson() => {
        "movies": List<dynamic>.from(movies.map((x) => x.toJson())),
      };
}

class Movie {
  int id;
  List<String>? movieCode;
  String titleEn;
  String titleTh;
  Rating rating;
  int ratingId;
  int duration;
  dynamic releaseDate;
  DateTime sneakDate;
  String synopsisTh;
  String synopsisEn;
  String director;
  String actor;
  String genre;
  String posterOri;
  String posterUrl;
  String trailer;
  String? trIos;
  String? trHd;
  String? trSd;
  String trMp4;
  String? priority;
  String? nowShowing;
  String? advanceTicket;
  DateTime dateUpdate;
  String? showBuyticket;
  String trailerCmsId;
  String trailerIvxKey;

  Movie({
    required this.id,
    this.movieCode,
    required this.titleEn,
    required this.titleTh,
    required this.rating,
    required this.ratingId,
    required this.duration,
    required this.releaseDate,
    required this.sneakDate,
    required this.synopsisTh,
    required this.synopsisEn,
    required this.director,
    required this.actor,
    required this.genre,
    required this.posterOri,
    required this.posterUrl,
    required this.trailer,
    this.trIos,
    this.trHd,
    this.trSd,
    required this.trMp4,
    this.priority,
    this.nowShowing,
    this.advanceTicket,
    required this.dateUpdate,
    this.showBuyticket,
    required this.trailerCmsId,
    required this.trailerIvxKey,
  });

  factory Movie.fromJson(Map<String, dynamic> json) => Movie(
        id: json["id"],
        movieCode: json["movieCode"] == null
            ? []
            : List<String>.from(json["movieCode"]!.map((x) => x)),
        titleEn: json["title_en"],
        titleTh: json["title_th"],
        rating: ratingValues.map[json["rating"]]!,
        ratingId: json["rating_id"],
        duration: json["duration"],
        releaseDate: json["release_date"],
        sneakDate: DateTime.parse(json["sneak_date"]),
        synopsisTh: json["synopsis_th"],
        synopsisEn: json["synopsis_en"],
        director: json["director"],
        actor: json["actor"],
        genre: json["genre"],
        posterOri: json["poster_ori"],
        posterUrl: json["poster_url"],
        trailer: json["trailer"],
        trIos: json["tr_ios"],
        trHd: json["tr_hd"],
        trSd: json["tr_sd"],
        trMp4: json["tr_mp4"],
        priority: json["priority"],
        nowShowing: json["now_showing"],
        advanceTicket: json["advance_ticket"],
        dateUpdate: DateTime.parse(json["date_update"]),
        showBuyticket: json["show_buyticket"],
        trailerCmsId: json["trailer_cms_id"],
        trailerIvxKey: json["trailer_ivx_key"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "movieCode": movieCode == null
            ? []
            : List<dynamic>.from(movieCode!.map((x) => x)),
        "title_en": titleEn,
        "title_th": titleTh,
        "rating": ratingValues.reverse[rating],
        "rating_id": ratingId,
        "duration": duration,
        "release_date": releaseDate,
        "sneak_date":
            "${sneakDate.year.toString().padLeft(4, '0')}-${sneakDate.month.toString().padLeft(2, '0')}-${sneakDate.day.toString().padLeft(2, '0')}",
        "synopsis_th": synopsisTh,
        "synopsis_en": synopsisEn,
        "director": director,
        "actor": actor,
        "genre": genre,
        "poster_ori": posterOri,
        "poster_url": posterUrl,
        "trailer": trailer,
        "tr_ios": trIos,
        "tr_hd": trHd,
        "tr_sd": trSd,
        "tr_mp4": trMp4,
        "priority": priority,
        "now_showing": nowShowing,
        "advance_ticket": advanceTicket,
        "date_update": dateUpdate.toIso8601String(),
        "show_buyticket": showBuyticket,
        "trailer_cms_id": trailerCmsId,
        "trailer_ivx_key": trailerIvxKey,
      };
}

enum Rating { EMPTY, THE_13, THE_15, THE_18, RATING }

final ratingValues = EnumValues({
  "ทป.": Rating.EMPTY,
  "": Rating.RATING,
  "น13+": Rating.THE_13,
  "น15+": Rating.THE_15,
  "น18+": Rating.THE_18
});

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
