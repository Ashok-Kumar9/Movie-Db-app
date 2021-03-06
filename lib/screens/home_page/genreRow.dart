import 'package:MovieFlex/models/movie_detail_model.dart';
import 'package:MovieFlex/screens/movie_info_page/movie_info_page.dart';
import 'package:MovieFlex/utils/reusable_widgets.dart';
import 'package:flutter/material.dart';
import 'dart:math';
import 'package:get/get.dart';

class GenreRow extends StatelessWidget {
  final List<MovieDetailModel>? movieDetailModel;
  final String? title;
  final bool? isCircular;

  GenreRow({this.movieDetailModel, this.title, this.isCircular});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 12.0, bottom: 12.0),
          child: Text(
            title!,
            style: TextStyle(color: Colors.white, fontSize: 24.0),
          ),
        ),
        Container(
          height: isCircular! ? 170.0 : 200.0,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: movieDetailModel!.length,
            itemBuilder: (BuildContext context, int index) {
              index = Random().nextInt(movieDetailModel!.length);
              return ReusableWidgets().movieImageTile(
                isCircular: isCircular!,
                posterPath: movieDetailModel![index].poster,
                onTap: () {
                  print('movie from row is clicked');
                  Get.to(
                    () => MovieInfoPage(
                      imdbId: movieDetailModel![index].imdbID,
                    ),
                  );
                },
              );
            },
          ),
        )
      ],
    );
  }
}
