import 'dart:ui' as ui;
import 'package:MovieFlex/models/movie_detail_model.dart';
import 'package:MovieFlex/screens/movie_info_page/movie_info_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_carousel_slider/carousel_slider.dart';
import 'package:flutter_carousel_slider/carousel_slider_indicators.dart';
import 'package:flutter_carousel_slider/carousel_slider_transforms.dart';
import 'package:get/get.dart';

class Carousel extends StatelessWidget {
  final List<MovieDetailModel>? movieDetailModel;
  Carousel({this.movieDetailModel});

  @override
  Widget build(BuildContext context) {
    MediaQueryData mediaQuery = MediaQueryData.fromWindow(ui.window);
    return Container(
      height: mediaQuery.size.height -
          kBottomNavigationBarHeight -
          mediaQuery.padding.bottom -
          mediaQuery.padding.top,
      child: CarouselSlider.builder(
        itemCount: 6,
        // itemCount: movieDetailModel!.length,
        slideBuilder: (index) {
          return stackImage(index);
        },
        slideTransform: CubeTransform(),
        slideIndicator: CircularSlideIndicator(
          currentIndicatorColor: Colors.lightBlue,
          indicatorBackgroundColor: Colors.white,
          padding: EdgeInsets.only(bottom: 10.0),
        ),
      ),
    );
  }

  GestureDetector stackImage(int index) {
    return GestureDetector(
      onTap: () => Get.to(() => MovieInfoPage(
            imdbId: movieDetailModel![index].imdbID,
          )),
      child: Stack(
        alignment: Alignment.center,
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: NetworkImage('${movieDetailModel![index].poster}'),
                  fit: BoxFit.cover),
            ),
          ),
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                  colors: [Colors.black, Colors.transparent],
                  begin: Alignment.bottomCenter,
                  end: Alignment.center),
            ),
          ),
        ],
      ),
    );
  }
}
