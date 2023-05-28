import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_cinemo_application/src/feed.dart';

class WebApiService {
  Future<Welcome> feed() async {
    final dio = Dio();
    final result =
        await dio.get("https://www.majorcineplex.com/apis/get_movie_avaiable");
    final movies = welcomeFromJson(jsonEncode(result.data));
    return movies;
  }
}
