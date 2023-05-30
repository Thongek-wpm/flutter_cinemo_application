import 'package:flutter/material.dart';
import 'package:flutter_cinemo_application/screens/favoriteUi.dart';
import 'package:flutter_cinemo_application/screens/viewUi.dart';

import 'package:flutter_cinemo_application/src/api.dart';

import 'package:dio/dio.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomeUi extends StatefulWidget {
  const HomeUi({Key? key}) : super(key: key);

  @override
  State<HomeUi> createState() => _HomeUiState();
}

class _HomeUiState extends State<HomeUi> {
  final TextEditingController _searchController = TextEditingController();
  final Dio dio = Dio();

  @override
  void initState() {
    _searchController.dispose();
    WebApiService().feed();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Cinemo',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        actions: [
          IconButton(
            onPressed: () async {
              final result = await Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => FavoritesUi()),
              );
              if (result != null) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('$result added to favorites'),
                    duration: const Duration(seconds: 2),
                  ),
                );
              }
            },
            icon: const Icon(
              FontAwesomeIcons.heart,
              color: Colors.pink,
            ),
          ),
        ],
        backgroundColor: Colors.black,
      ),
      body: Center(
        child: FutureBuilder(
          future: WebApiService().feed(),
          builder: (context, snapshot) {
            if (snapshot.hasData == false) {
              return const CircularProgressIndicator();
            }
            final movies = snapshot.data;
            return Scaffold(
              body: ListView.builder(
                itemCount: movies?.length,
                itemBuilder: (context, index) {
                  return Card(
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: ClipRect(
                            child: Image.network(
                              movies!.movies[index].posterUrl,
                              height: 140,
                              width: 90,
                              fit: BoxFit.fill,
                            ),
                          ),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(top: 2),
                              child: Text(
                                movies.movies[index].genre,
                                style: const TextStyle(
                                  fontSize: 6.50,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 2),
                              child: Text(
                                movies.movies[index].titleEn,
                                style: const TextStyle(
                                    fontSize: 10, fontWeight: FontWeight.bold),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 0.5),
                              child: Text(
                                movies.movies[index].titleTh,
                                style: const TextStyle(
                                    fontSize: 10, fontWeight: FontWeight.bold),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 5),
                              child: Text(
                                movies.movies[index].releaseDate,
                                style: const TextStyle(
                                  fontSize: 10,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 30),
                              child: TextButton(
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => ViewUi(
                                        movies.movies[index],
                                        key: UniqueKey(),
                                      ),
                                    ),
                                  );
                                },
                                child: const Row(
                                  children: [
                                    Text(
                                      'View more',
                                      style: TextStyle(
                                        fontSize: 10.50,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black,
                                      ),
                                    ),
                                    Icon(
                                      Icons.arrow_forward_ios,
                                      size: 10.50,
                                      color: Colors.black,
                                    )
                                  ],
                                ),
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                  );
                },
              ),
            );
          },
        ),
      ),
    );
  }
}
