import 'package:MovieFlex/screens/profile_page/profile_page.dart';
import 'package:MovieFlex/screens/search_page/search_page.dart';
import 'package:flutter/material.dart';

import 'activity_page/activity_page.dart';
import 'add_page/movie_player.dart';
import 'home_page/home_page.dart';

class NavigationBarOurs extends StatefulWidget {
  const NavigationBarOurs({Key? key}) : super(key: key);

  @override
  _NavigationBarOursState createState() => _NavigationBarOursState();
}

class _NavigationBarOursState extends State<NavigationBarOurs> {
  int _selectedIndex = 0;

  final screens = [
    HomePage(),
    SearchPage(),
    MoviePlayer(),
    ActivityPage(),
    ProfilePage()
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        children: screens,
        index: _selectedIndex,
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.movie_creation_outlined),
            label: 'Movies',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: 'Activity',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle),
            label: 'User',
          ),
        ],
        currentIndex: _selectedIndex,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.lightBlue,
        backgroundColor: Colors.black,
        unselectedItemColor: Colors.white54,
        selectedFontSize: 14,
        onTap: _onItemTapped,
      ),
    );
  }
}
