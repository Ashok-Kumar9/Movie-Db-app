import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:teachedison/screens/home_page/home_page.dart';
import 'package:teachedison/utils/reusable_widgets.dart';

class WatchListPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 48.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.movie_creation_outlined,
                  size: 50.0, color: Colors.white),
              SizedBox(height: 16.0),
              Text(
                'You haven\'t buy any movie yet',
                style: TextStyle(color: Colors.white),
              ),
              SizedBox(height: 16.0),
              ReusableWidgets().elevatedButtonWithIcon(Icons.add_circle,
                  'Add to Watchlist', () => Get.to(() => HomePage()))
            ],
          ),
        ),
      ),
    );
  }
}
