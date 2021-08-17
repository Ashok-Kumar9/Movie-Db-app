import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:teachedison/models/movie_detail_model.dart';
import 'package:teachedison/screens/movie_info_page/movie_info_page.dart';

class ReusableWidgets {
  GestureDetector iconButtonWithText(
      int? id, IconData iconData, String text, Function() onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          Icon(
            iconData,
            color: Color(0xff065F62),
          ),
          Text(
            text,
            style: TextStyle(color: Color(0xff065F62)),
          )
        ],
      ),
    );
  }

  ElevatedButton elevatedButtonWithIcon(
      IconData iconData, String text, Function() onTap) {
    return ElevatedButton(
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(Colors.grey),
      ),
      onPressed: onTap,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            iconData,
            color: Color(0xff065F62),
          ),
          SizedBox(
            width: 6,
          ),
          Text(
            text,
            style: TextStyle(color: Color(0xff065F62)),
          ),
        ],
      ),
    );
  }

  GestureDetector movieImageTile(
      {String? posterPath,
      required Function() onTap,
      bool isCircular = false}) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 8.0),
        height: isCircular ? 170.0 : 200.0,
        width: isCircular ? 170.0 : 150.0,
        decoration: (isCircular
                ? BoxDecoration(shape: BoxShape.circle)
                : BoxDecoration(
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.circular(6)))
            .copyWith(
          image: DecorationImage(
            image: NetworkImage(
              posterPath!,
            ),
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }

  Card genreCard(Color color, String genreName, String imagePath) {
    return Card(
      clipBehavior: Clip.antiAlias,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
      color: color,
      child: Column(
        children: [
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: NetworkImage(imagePath), fit: BoxFit.fill),
              ),
            ),
          ),
          Text(
            genreName,
            style: TextStyle(
                color: Colors.white,
                fontSize: 16.0,
                fontWeight: FontWeight.w500),
          ),
        ],
      ),
    );
  }

  Expanded movieDetails(
      {required MovieDetailModel movieDetailModel, bool isFavList = false}) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: movieDetailModel.title,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 22,
                        fontWeight: FontWeight.w900),
                  ),
                  TextSpan(
                    text: ' (${movieDetailModel.year})',
                    style: TextStyle(
                        color: Colors.red.withOpacity(1), fontSize: 18),
                  ),
                ],
              ),
            ),
            SizedBox(height: 6),
            RichText(
              text: TextSpan(
                children: [
                  for (int i = 0;
                      i < movieDetailModel.genre!.split(',').length;
                      i++)
                    TextSpan(
                      text: movieDetailModel.genre!.split(',')[i] + ' ',
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    ),
                ],
              ),
            ),
            SizedBox(height: 8),
            Row(
              children: [
                IconTheme(
                  data: IconThemeData(
                    color: Colors.blue,
                    size: 20,
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: List.generate(
                      5,
                      (index) {
                        return Icon(
                          index <
                                  (((double.parse(movieDetailModel.imdbRating
                                              .toString())) /
                                          2)
                                      .round())
                              ? Icons.star
                              : Icons.star_border,
                        );
                      },
                    ),
                  ),
                ),
                RichText(
                  text: TextSpan(
                    text: "  " +
                        (((double.parse(movieDetailModel.imdbRating
                                        .toString())) /
                                    2)
                                .toStringAsFixed(1))
                            .toString() +
                        "/5",
                    style: TextStyle(
                      fontSize: 14,
                      letterSpacing: 1.2,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 10.0),
            if (isFavList)
              ReusableWidgets().elevatedButtonWithIcon(
                  Icons.favorite_border, 'Add to Favorite', () => null)
            else
              ReusableWidgets().elevatedButtonWithIcon(
                  Icons.info_outlined,
                  'See more details',
                  () => Get.to(() => MovieInfoPage(
                        imdbId: movieDetailModel.imdbID,
                      ))),
            ReusableWidgets().elevatedButtonWithIcon(
                Icons.play_arrow, '💳  Play/Buy Now', () => null),
          ],
        ),
      ),
    );
  }
}
