import 'package:flutter/material.dart';
import 'package:dio/dio.dart';

import '../src/itemsFav.dart';

class FavoireUi extends StatefulWidget {
  const FavoireUi({super.key});

  @override
  State<FavoireUi> createState() => _FavoireUiState();
}

class _FavoireUiState extends State<FavoireUi> {
  Dio dio = Dio();

  List<dynamic> favorites = [];

  @override
  void initState() {
    super.initState();
    fetchFavorites().then((data) {
      setState(() {
        favorites = data;
      });
    }).catchError((error) {
      print(error);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(  body: ListView.builder(
        itemCount: favorites.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(favorites[index]['name']),
            subtitle: Text(favorites[index]['description']),
          );
        },
      ),);
  }
}
