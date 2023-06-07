// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_cinemo_application/src/feed.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ViewUi extends StatefulWidget {
  final Movie movie;

  const ViewUi({super.key, required this.movie});

  @override
  _ViewUiState createState() => _ViewUiState();
}

class _ViewUiState extends State<ViewUi> {
  bool isFavorite = false;
  bool isToggling = false;

  Future<void> toggleFavorite() async {
    if (isToggling) return;

    setState(() {
      isToggling = true;
    });

    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> favoriteMovies = prefs.getStringList('favorite_movies') ?? [];

    if (isFavorite) {
      favoriteMovies.remove(widget.movie.titleEn);
      isFavorite = false;
    } else {
      if (!favoriteMovies.contains(widget.movie.titleEn)) {
        favoriteMovies.add(widget.movie.titleEn);
        isFavorite = true;
      }
    }

    await prefs.setStringList('favorite_movies', favoriteMovies);

    setState(() {
      isToggling = false;
    });
  }

  @override
  void initState() {
    super.initState();
    checkFavorite();
  }

  Future<void> checkFavorite() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> favoriteMovies = prefs.getStringList('favorite_movies') ?? [];

    setState(() {
      isFavorite = favoriteMovies.contains(widget.movie.titleEn);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back_ios),
        ),
        title: const Text(
          'Cinemo',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.black,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(6.0),
                  child: ClipRect(
                    child: Image.network(
                      widget.movie.posterUrl,
                      height: 200,
                      width: 150,
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      widget.movie.genre,
                      style: const TextStyle(
                        fontSize: 10,
                        fontWeight: FontWeight.bold,
                        color: Colors.black38,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 5),
                      child: Text(
                        widget.movie.titleEn,
                        style: const TextStyle(
                          fontSize: 10.05,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 0.1),
                      child: Text(
                        widget.movie.titleTh,
                        style: const TextStyle(
                          fontSize: 10.05,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 5),
                      child: Text(
                        widget.movie.releaseDate,
                        style: const TextStyle(
                          fontSize: 10,
                          fontWeight: FontWeight.bold,
                          color: Colors.black26,
                        ),
                      ),
                    ),
                    Row(
                      children: [
                        const Padding(
                          padding: EdgeInsets.only(top: 5),
                          child: Text(
                            "Director : ",
                            style: TextStyle(
                              fontSize: 6.50,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 5),
                          child: Text(
                            widget.movie.director,
                            style: const TextStyle(
                              fontSize: 6.50,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Card(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(widget.movie.synopsisTh),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 70, vertical: 50),
              child: Center(
                child: ElevatedButton(
                  onPressed: isToggling ? null : toggleFavorite,
                  style: ElevatedButton.styleFrom(
                    primary: isFavorite ? Colors.red : null,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(
                        FontAwesomeIcons.heartCirclePlus,
                        size: 15,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(isFavorite
                            ? 'Remove from Favorite'
                            : 'Add To Favorite'),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
