// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:flutter_cinemo_application/src/feed.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

// ignore: unused_import
import 'favoriteUi.dart';

class ViewUi extends StatefulWidget {
  final Movie movies;

  const ViewUi(this.movies, {required Key key}) : super(key: key);

  @override
  _ViewUiState createState() => _ViewUiState();
}

class _ViewUiState extends State<ViewUi> {
  bool isFavorite = false;
  Future<void> toggleFavorite() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> favoriteMovies = prefs.getStringList('favorite_movies') ?? [];

    if (isFavorite) {
      favoriteMovies.remove(widget.movies.titleEn);
      isFavorite = false;
    } else {
      if (!favoriteMovies.contains(widget.movies.titleEn)) {
        favoriteMovies.add(widget.movies.titleEn);
        isFavorite = true;
      }
    }

    await prefs.setStringList('favorite_movies', favoriteMovies);
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
                      widget.movies.posterUrl,
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
                      widget.movies.genre,
                      style: const TextStyle(
                        fontSize: 10,
                        fontWeight: FontWeight.bold,
                        color: Colors.black38,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 5),
                      child: Text(
                        widget.movies.titleEn,
                        style: const TextStyle(
                          fontSize: 10.05,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 0.1),
                      child: Text(
                        widget.movies.titleTh,
                        style: const TextStyle(
                          fontSize: 10.05,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 5),
                      child: Text(
                        widget.movies.releaseDate,
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
                            widget.movies.director,
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
                      child: Text(widget.movies.synopsisTh),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 70, vertical: 50),
              child: Center(
                child: ElevatedButton(
                  onPressed: toggleFavorite,
                  style: ElevatedButton.styleFrom(
                    // ignore: deprecated_member_use
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
