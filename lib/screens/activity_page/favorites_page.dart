import 'package:flutter/material.dart';
import 'package:teachedison/controllers/movie_detail_controller.dart';
import 'package:teachedison/models/movie_detail_model.dart';
import 'package:teachedison/utils/reusable_widgets.dart';
import 'package:get/get.dart';

class FavoritesPage extends StatefulWidget {
  const FavoritesPage({Key? key}) : super(key: key);

  @override
  _FavoritesPageState createState() => _FavoritesPageState();
}

class _FavoritesPageState extends State<FavoritesPage> {
  final MovieDetailController movieController = Get.find();
  ScrollController? scrollController = ScrollController();
  List<MovieDetailModel>? watchlist;
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    watchListMovies();
  }

  void watchListMovies() async {
    setState(() {
      watchlist = movieController.listOfMovies;
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 30.0),
        child: isLoading
            ? Center(child: RefreshProgressIndicator())
            : ListView.separated(
                separatorBuilder: (BuildContext context, int index) => Padding(
                  padding: const EdgeInsets.symmetric(vertical: 4.0),
                  child: Divider(
                        color: Colors.grey[800],
                        thickness: 1,
                      ),
                ),
                itemCount: watchlist!.length,
                itemBuilder: (BuildContext context, int index) =>
                    movieTile(index)),
      ),
    );
  }

  Row movieTile(int index) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        ReusableWidgets()
            .movieImageTile(onTap: () {}, posterPath: watchlist![index].poster),
        ReusableWidgets().movieDetails(movieDetailModel: watchlist![index]),
      ],
    );
  }
}
