import 'package:flutter/material.dart';

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
              'https://image.tmdb.org/t/p/w500/$posterPath',
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
}
