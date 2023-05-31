import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FavoritesUi extends StatefulWidget {
  @override
  _FavoritesUiState createState() => _FavoritesUiState();
}

class _FavoritesUiState extends State<FavoritesUi> {
  List<String> favoriteMovies = [];
  List<String> filteredMovies = [];

  @override
  void initState() {
    super.initState();
    loadFavoriteMovies();
  }

  Future<void> loadFavoriteMovies() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      favoriteMovies = prefs.getStringList('favorite_movies') ?? [];
      filteredMovies = favoriteMovies;
    });
  }

  Future<void> removeFavoriteMovie(String movieTitle) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> updatedFavoriteMovies = [...favoriteMovies];
    updatedFavoriteMovies.remove(movieTitle);
    await prefs.setStringList('favorite_movies', updatedFavoriteMovies);
    setState(() {
      favoriteMovies = updatedFavoriteMovies;
      filteredMovies = updatedFavoriteMovies;
    });
  }

  void filterMovies(String query) {
    setState(() {
      filteredMovies = favoriteMovies
          .where((movie) => movie.toLowerCase().contains(query.toLowerCase()))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: [
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: TextField(
            onChanged: filterMovies,
            decoration: InputDecoration(
              labelText: 'Search Favorite',
              prefixIcon: Icon(Icons.search),
            ),
          ),
        ),
        Expanded(
            child: ListView.builder(
          itemCount: filteredMovies.length,
          itemBuilder: (context, index) {
            // แยกชื่อหนังอังกฤษและไทย
            String movieTitleEn = filteredMovies[index];
            String movieTitleTh = filteredMovies[index];
            // คุณต้องเพิ่มโค้ดเพื่อดึงชื่อหนังไทยจากข้อมูลหนังของคุณ

            return ListTile(
              title: Text(movieTitleEn), // แสดงชื่อหนังอังกฤษ
              subtitle: Text(movieTitleTh), // แสดงชื่อหนังไทย
              trailing: IconButton(
                onPressed: () {
                  removeFavoriteMovie(filteredMovies[index]);
                },
                icon: Icon(Icons.remove_circle),
              ),
            );
          },
        ))
      ]),
    );
  }
}
