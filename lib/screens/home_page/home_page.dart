import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:teachedison/controllers/movie_detail_controller.dart';
import 'package:teachedison/screens/home_page/carousel.dart';
import 'genreRow.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool isLoading = true;
  ScrollController scrollController = ScrollController();
  final MovieDetailController movieController =
      Get.put(MovieDetailController());

  @override
  void initState() {
    super.initState();
    loadMovies();
  }

  void loadMovies() async {
    await movieController.getMovieDetails();
    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: !isLoading
          ? SafeArea(
              child: CustomScrollView(
                controller: scrollController,
                slivers: [
                  SliverToBoxAdapter(
                    child: Carousel(
                      movieDetailModel: movieController.listOfMovies,
                    ),
                  ),
                  sliverBox(
                    genre: 'Trending',
                    circular: true,
                  ),
                  sliverBox(
                    genre: 'Top Rated',
                  ),
                  sliverBox(
                    genre: 'Comedy',
                  ),
                  sliverBox(
                    genre: 'Thriller',
                  ),
                ],
              ),
            )
          : Center(
              child: RefreshProgressIndicator(),
            ),
    );
  }

  SliverPadding sliverBox({
    required String genre,
    bool? circular,
  }) {
    return SliverPadding(
      padding: const EdgeInsets.only(top: 30.0),
      sliver: SliverToBoxAdapter(
        child: GenreRow(
          title: genre,
          movieDetailModel: movieController.listOfMovies,
          isCircular: circular ?? false,
        ),
      ),
    );
  }
}
