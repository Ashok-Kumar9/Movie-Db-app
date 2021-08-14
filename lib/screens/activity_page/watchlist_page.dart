import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:teachedison/controllers/movie_detail_controller.dart';
import 'package:teachedison/models/movie_detail_model.dart';
import 'package:teachedison/utils/reusable_widgets.dart';

class WatchListPage extends StatefulWidget {
  const WatchListPage({Key? key}) : super(key: key);

  @override
  _WatchListPageState createState() => _WatchListPageState();
}

class _WatchListPageState extends State<WatchListPage> {
  final MovieDetailController movieController = Get.find();
  ScrollController? scrollController = ScrollController();
  late  List<MovieDetailModel> watchlist;

  @override
  void initState() {
    super.initState();
    watchListMovies();
  }

  void watchListMovies() async {
    setState(() {
      watchlist = movieController.listOfMovies;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 30.0),
        child: watchlist.isEmpty
            ? Center(child: RefreshProgressIndicator())
            : ListView.separated(
                separatorBuilder: (BuildContext context, int index) => Divider(
                      color: Colors.green,
                      thickness: 1,
                    ),
                itemCount: watchlist.length,
                itemBuilder: (BuildContext context, int index) =>
                    movieTile(index)),
      ),
    );
  }

  Row movieTile(int index) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        ReusableWidgets().movieImageTile(
            onTap: () {},
            posterPath: watchlist[index].poster),
        ReusableWidgets().movieDetails(watchlist[index]),
      ],
    );
  }
}
