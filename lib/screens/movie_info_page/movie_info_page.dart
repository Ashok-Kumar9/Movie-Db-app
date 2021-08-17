import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:teachedison/controllers/movie_detail_controller.dart';
import 'package:teachedison/models/movie_detail_model.dart';
import 'package:teachedison/utils/reusable_widgets.dart';

class MovieInfoPage extends StatefulWidget {
  String? imdbId;
  MovieInfoPage({this.imdbId});

  @override
  _MovieInfoPageState createState() => _MovieInfoPageState();
}

class _MovieInfoPageState extends State<MovieInfoPage> {
  ScrollController? scrollController = ScrollController();
  MovieDetailController movieDetailController = Get.find();
  MovieDetailModel? movieDetailModel;
  bool isLoading = true;

  getMovieInfo() async {
    MovieDetailModel data =
        await movieDetailController.getByImdbID(widget.imdbId.toString());
    setState(() {
      movieDetailModel = data;
      isLoading = false;
    });
  }

  @override
  void initState() {
    super.initState();
    getMovieInfo();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: !isLoading
          ? CustomScrollView(
              controller: scrollController,
              slivers: [
                SliverAppBar(
                  backgroundColor: Colors.black,
                  expandedHeight: 250.0,
                  flexibleSpace: FlexibleSpaceBar(
                    background: Stack(
                      alignment: Alignment.center,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            image: DecorationImage(
                                image:
                                    NetworkImage('${movieDetailModel!.poster}'),
                                fit: BoxFit.fill),
                          ),
                        ),
                        Container(
                          decoration: const BoxDecoration(
                            gradient: LinearGradient(
                                colors: [Colors.black, Colors.transparent],
                                begin: Alignment.bottomCenter,
                                end: Alignment.topCenter),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SliverPadding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 10, horizontal: 10.0),
                  sliver: SliverToBoxAdapter(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        ReusableWidgets().movieImageTile(
                          onTap: () {},
                          posterPath: movieDetailModel!.poster,
                        ),
                        ReusableWidgets().movieDetails(movieDetailModel: movieDetailModel!, isFavList: true),
                      ],
                    ),
                  ),
                ),
                SliverPadding(
                  padding: const EdgeInsets.all(10.0),
                  sliver: SliverToBoxAdapter(
                    child: movieDescription(movieDetailModel!.plot.toString()),
                  ),
                ),
                SliverPadding(
                  padding: const EdgeInsets.all(10.0),
                  sliver: SliverToBoxAdapter(
                    child: trailerColumn(movieDetailModel!),
                  ),
                ),
                SliverPadding(
                  padding: const EdgeInsets.all(10.0),
                  sliver: SliverToBoxAdapter(
                    child: castColumn(movieDetailModel!),
                  ),
                ),
              ],
            )
          : Center(child: RefreshProgressIndicator()),
    );
  }

  Column castColumn(MovieDetailModel movieDetailModel) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Material(
          color: Colors.transparent,
          child: Text(
            "Cast",
            style: TextStyle(
                fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white),
          ),
        ),
        SizedBox(height: 10),
        SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          scrollDirection: Axis.horizontal,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              for (int i = 0;
                  i < movieDetailModel.actors!.split(',').length;
                  i++)
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 10.0, vertical: 8.0),
                  child: Container(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ReusableWidgets().movieImageTile(
                          onTap: () {},
                          posterPath:
                              'https://m.media-amazon.com/images/M/MV5BYWJjYzcxYjgtMjkxZi00NmE0LTgyNjItMTEyYjhiMjQ0YzdkXkEyXkFqcGdeQXVyMTk2ODE5NjI@._V1_UY317_CR1,0,214,317_AL__QL50.jpg',
                        ),
                        SizedBox(height: 8),
                        Material(
                          color: Colors.transparent,
                          child: Text(
                            movieDetailModel.actors!.split(',')[i],
                            maxLines: 2,
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 14,
                                fontWeight: FontWeight.w700),
                          ),
                        ),
                      ],
                    ),
                  ),
                )
            ],
          ),
        ),
      ],
    );
  }

  Column trailerColumn(MovieDetailModel movieDetailModel) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Material(
          color: Colors.transparent,
          child: Text(
            "Trailers",
            style: TextStyle(
                fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white),
          ),
        ),
        SizedBox(height: 10),
        SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          scrollDirection: Axis.horizontal,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              for (int i = 0; i < 5; i++)
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 10.0, vertical: 8.0),
                  child: Container(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Stack(
                          children: [
                            Container(
                              color: Colors.black,
                              child: Image(
                                image: NetworkImage(
                                    'https://tse2.mm.bing.net/th?id=OIP.NVTIFu0T9hRfyn5QOJRNjwHaEO&pid=Api&P=0&w=265&h=152'),
                                height: 120.0,
                              ),
                            ),
                            Positioned(
                              top: 0,
                              left: 0,
                              child: CircleAvatar(
                                backgroundColor: Colors.black,
                                radius: 16.0,
                                child: Icon(
                                  Icons.play_arrow,
                                  color: Colors.lightBlue,
                                  size: 32.0,
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Material(
                          color: Colors.transparent,
                          child: Text(movieDetailModel.released.toString(),
                              maxLines: 2,
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w700)),
                        )
                      ],
                    ),
                  ),
                )
            ],
          ),
        )
      ],
    );
  }

  Column movieDescription(String description) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Material(
          color: Colors.transparent,
          child: Text(
            "Overview",
            style: TextStyle(
                fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white),
          ),
        ),
        SizedBox(height: 10),
        RichText(
          text: TextSpan(
              text: description,
              style: TextStyle(fontSize: 16, color: Colors.blueGrey)),
        ),
      ],
    );
  }
}
