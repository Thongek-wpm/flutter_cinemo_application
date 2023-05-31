import 'package:flutter/material.dart';
import 'package:flutter_cinemo_application/screens/viewUi.dart';
import 'package:flutter_cinemo_application/src/api.dart';
import 'package:flutter_cinemo_application/src/feed.dart';

class HomeUi extends StatefulWidget {
  @override
  _HomeUiState createState() => _HomeUiState();
}

class _HomeUiState extends State<HomeUi> {
  final WebApiService apiService = WebApiService();
  late List<Movie> allMovies;
  late List<Movie> displayedMovies;

  void initState() {
    super.initState();
    displayedMovies = [];
    fetchMovies();
  }

  Future<void> fetchMovies() async {
    final movies = await apiService.feed();
    setState(() {
      allMovies = movies.movies;
      displayedMovies = movies.movies;
    });
  }

  void searchMovies(String query) {
    final lowerCaseQuery = query.toLowerCase();
    setState(() {
      displayedMovies = allMovies.where((movie) {
        final title = movie.titleEn.toLowerCase();
        return title.contains(lowerCaseQuery);
      }).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              onChanged: (value) {
                searchMovies(value);
              },
              decoration: const InputDecoration(
                labelText: 'Search Movies',
                prefixIcon: Icon(Icons.search),
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: displayedMovies.length,
              itemBuilder: (BuildContext context, int index) {
                final movie = displayedMovies[index];
                return ListTile(
                  leading: Image.network(movie.posterUrl),
                  title: Text(movie.titleEn),
                  subtitle: Text(movie.titleTh),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ViewUi(
                          movie: movie,
                        ),
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
