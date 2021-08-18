import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:teachedison/screens/home_page/home_page.dart';
import 'package:teachedison/screens/navigation_bar.dart';
import 'package:teachedison/screens/splash_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: NavigationBar(),
    );
  }
}
