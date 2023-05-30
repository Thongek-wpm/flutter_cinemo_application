import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cinemo_application/src/feed.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
Dio dio = Dio();

class ViewUi extends StatelessWidget {
  final Movie movies;
  const ViewUi(this.movies, {super.key});

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
                      movies.posterUrl,
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
                      movies.genre,
                      style: const TextStyle(
                        fontSize: 10,
                        fontWeight: FontWeight.bold,
                        color: Colors.black38,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 5),
                      child: Text(
                        movies.titleEn,
                        style: const TextStyle(
                          fontSize: 10.05,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 0.1),
                      child: Text(
                        movies.titleTh,
                        style: const TextStyle(
                          fontSize: 10.05,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 5),
                      child: Text(
                        movies.releaseDate,
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
                              fontSize: 11,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 5),
                          child: Text(
                            movies.director,
                            style: const TextStyle(
                              fontSize: 11,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        )
                      ],
                    ),
                  ],
                )
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
                      child: Text(movies.synopsisTh),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 70, vertical: 50),
              child: Center(
                child: ElevatedButton(
                  onPressed: () {},
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        FontAwesomeIcons.heartCirclePlus,
                        size: 15,
                      ),
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text('Add To Favorite'),
                      )
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}