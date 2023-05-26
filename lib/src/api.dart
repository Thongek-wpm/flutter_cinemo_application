import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_cinemo_application/src/feed.dart';

class WebApiService {
  Future<Welcome> feed() async {
    final dio = Dio();
    final result = await dio.get("https://api.sampleapis.com/coffee/hot");
    final movies = welcomeFromJson(jsonEncode(result.data));
    return movies;
  }
}
