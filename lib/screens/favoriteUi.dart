import 'package:flutter/material.dart';

class FavoireUi extends StatefulWidget {
  const FavoireUi({super.key});

  @override
  State<FavoireUi> createState() => _FavoireUiState();
}

class _FavoireUiState extends State<FavoireUi> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        flexibleSpace: Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextField(
            onChanged: (value) => '',
            decoration: const InputDecoration(
              suffixIcon: Icon(Icons.search),
              labelText: 'Movie Favorite',
            ),
          ),
        ),
        backgroundColor: Colors.white,
      ),
    );
  }
}
