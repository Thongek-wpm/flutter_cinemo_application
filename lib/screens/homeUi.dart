import 'package:flutter/material.dart';

class HomeUi extends StatefulWidget {
  const HomeUi({super.key});

  @override
  State<HomeUi> createState() => _HomeUiState();
}

class _HomeUiState extends State<HomeUi> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Column(
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
          Padding(
            padding: EdgeInsets.all(8.0),
            child: SingleChildScrollView(
                child: Card(
              margin: EdgeInsets.all(5),
              child: Row(
                children: [],
              ),
            )),
          )
        ],
      ),
    );
  }
}
