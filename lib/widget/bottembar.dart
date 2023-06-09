import 'package:flutter/material.dart';
import 'package:flutter_cinemo_application/screens/favoriteUi.dart';
import 'package:flutter_cinemo_application/screens/homeUi.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class BottemBar extends StatefulWidget {
  const BottemBar({Key? key}) : super(key: key);

  @override
  State<BottemBar> createState() => _BottemBarState();
}

class _BottemBarState extends State<BottemBar> {
  int _selectedIndex = 0;
  static List<Widget> _widgetOptions = <Widget>[
    HomeUi(),
    FavoritesUi(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Cinemo',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.black,
      ),
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(FontAwesomeIcons.heart),
            label: 'Favorite',
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}
