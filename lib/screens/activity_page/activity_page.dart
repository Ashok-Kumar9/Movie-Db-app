import 'package:flutter/material.dart';
import 'package:teachedison/screens/activity_page/watchlist_page.dart';

import 'favorites_page.dart';

class ActivityPage extends StatefulWidget {
  const ActivityPage({Key? key}) : super(key: key);

  @override
  _ActivityPageState createState() => _ActivityPageState();
}

class _ActivityPageState extends State<ActivityPage> {

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          toolbarHeight: kMinInteractiveDimension,
          backgroundColor: Colors.black,
          bottom: TabBar(
            indicatorColor: Colors.lightBlue,
            overlayColor: MaterialStateProperty.all(Colors.black),
            labelColor: Colors.white,
            labelStyle: TextStyle(fontSize: 18.0),
            tabs: [Tab(text: 'Watchlist'), Tab(text: 'Favorites')],
          ),
        ),
        body: TabBarView(
          children: [WatchListPage(), FavoritesPage()],
        ),
      ),
    );
  }
}
