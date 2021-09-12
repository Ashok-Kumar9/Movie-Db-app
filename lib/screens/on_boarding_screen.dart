import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:introduction_screen/introduction_screen.dart';

import 'navigation_bar.dart';

class OnBoardingScreen extends StatefulWidget {
  OnBoardingScreen({Key? key}) : super(key: key);

  @override
  _OnBoardingScreenState createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  Widget _buildImage(String assetName) {
    return Image(image: AssetImage(assetName), height: 350,);
  }

  @override
  Widget build(BuildContext context) {
    const pageDecoration = const PageDecoration(
      titleTextStyle: TextStyle(fontSize: 28.0, fontWeight: FontWeight.w700, color: Colors.white),
      bodyTextStyle: TextStyle(fontSize: 19.0, color: Colors.white),
      descriptionPadding: EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 16.0),
      pageColor: Colors.black,
      imagePadding: EdgeInsets.zero,
      bodyFlex: 1,
      imageFlex: 2
    );

    return IntroductionScreen(
      globalBackgroundColor: Colors.black,
      isTopSafeArea: true,
      pages: [
        PageViewModel(
          title: 'Movie Flex',
          body:
              "An app to which provides the Theatre experience in your phone.",
          image: _buildImage('assets/images/app_icon.png'),
          decoration: pageDecoration,
        ),
        PageViewModel(
          title: "Live Movies",
          body:
              "One can watch any movie online with anyone.",
          image: _buildImage('assets/images/app_icon.png'),
          decoration: pageDecoration,
        ),
        PageViewModel(
          title: "Support and Payment Gateway",
          body:
              "Easy process of buying any movie and also one can request for a movie if it\'s not already present.",
          image: _buildImage('assets/images/app_icon.png'),
          decoration: pageDecoration,
        ),
      ],
      onDone: () => Get.off(() => NavigationBar()),
      showSkipButton: true,
      skipFlex: 0,
      nextFlex: 0,
      skip: const Text(
        'Skip',
        style: TextStyle(color: Colors.lightBlue, fontSize: 16.0),
      ),
      next: CircleAvatar(
        child: const Icon(
          Icons.arrow_forward,
          color: Colors.white,
        ),
        backgroundColor: Colors.lightBlue,
        radius: 16.0,
      ),
      done: const Text(
        'Done',
        style: TextStyle(color: Colors.lightBlue, fontSize: 16.0),
      ),
      curve: Curves.fastLinearToSlowEaseIn,
      controlsMargin: const EdgeInsets.all(16),
      controlsPadding: const EdgeInsets.fromLTRB(8.0, 4.0, 8.0, 4.0),
      dotsDecorator: const DotsDecorator(
        size: Size(10.0, 10.0),
        color: Colors.grey,
        activeSize: Size(22.0, 10.0),
        activeColor: Colors.lightBlue,
        activeShape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(24.0)),
        ),
      ),
      dotsContainerDecorator: const ShapeDecoration(
        color: Colors.transparent,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(8.0)),
        ),
      ),
    );
  }
}
