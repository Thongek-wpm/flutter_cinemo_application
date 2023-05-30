import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FavoritesUi extends StatefulWidget {
  @override
  _FavoritesUiState createState() => _FavoritesUiState();
}

class _FavoritesUiState extends State<FavoritesUi> {
  List<String> favoriteMovies = [];

  @override
  void initState() {
    super.initState();
    loadFavoriteMovies();
  }

  Future<void> loadFavoriteMovies() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      favoriteMovies = prefs.getStringList('favorite_movies') ?? [];
    });
  }

  Future<void> removeFavoriteMovie(String movieTitle) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> updatedFavoriteMovies = [...favoriteMovies];
    updatedFavoriteMovies.remove(movieTitle);
    await prefs.setStringList('favorite_movies', updatedFavoriteMovies);
    setState(() {
      favoriteMovies = updatedFavoriteMovies;
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
          'Favorites',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.black,
      ),
      body: ListView.builder(
        itemCount: favoriteMovies.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(favoriteMovies[index]),
            trailing: IconButton(
              onPressed: () {
                removeFavoriteMovie(favoriteMovies[index]);
              },
              icon: Icon(Icons.remove_circle),
            ),
          );
        },
      ),
    );
  }
}
