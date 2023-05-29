import 'package:flutter/material.dart';
import 'package:flutter_cinemo_application/src/feed.dart';

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
      body: Center(
        child: Row(children: [
          ClipRect(
            child: Image.network(''),
          )
        ]),
      ),
    );
  }
}
