import 'package:flutter/material.dart';
import 'package:splash_screen_view/SplashScreenView.dart';

import 'on_boarding_screen.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SplashScreenView(
      navigateRoute: OnBoardingScreen(),
      duration: 5000,
      imageSize: 300,
      imageSrc: "assets/images/app_icon.png",
      text: 'Movie Flex',
      textType: TextType.TyperAnimatedText,
      textStyle: TextStyle(
        fontSize: 30.0,
        color: Colors.white
      ),
      backgroundColor: Colors.black,
    );
  }
}
