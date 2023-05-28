// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter_cinemo_application/src/api.dart';

class HomeUi extends StatefulWidget {
  const HomeUi({super.key});

  @override
  State<HomeUi> createState() => _HomeUiState();
}

class _HomeUiState extends State<HomeUi> {
  @override
  void initState() {
    // ignore: todo
    // TODO: implement initState
    WebApiService().feed();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Center(
          child: FutureBuilder(
            future: WebApiService().feed(),
            builder: ((context, snapshot) {
              if (snapshot.hasData == false) {
                return const CircularProgressIndicator();
              }
              final movie = snapshot.data;
              return const Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                    child: TextField(
                      decoration: InputDecoration(
                        icon: Icon(Icons.search),
                        labelText: 'Movie Finder',
                      ),
                    ),
                  ),
                  Card(child: Column()),
                ],
              );
            }),
          ),
        ),
      ),
    );
  }
}
