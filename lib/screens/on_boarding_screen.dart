import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:teachedison/screens/navigation_bar.dart';

class OnBoardingScreen extends StatefulWidget {
  OnBoardingScreen({Key? key}) : super(key: key);

  @override
  _OnBoardingScreenState createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  Widget _buildImage(String assetName) {
    return Image(image: AssetImage(assetName));
  }

  @override
  Widget build(BuildContext context) {
    const pageDecoration = const PageDecoration(
      titleTextStyle: TextStyle(fontSize: 28.0, fontWeight: FontWeight.w700),
      bodyTextStyle: TextStyle(fontSize: 19.0),
      descriptionPadding: EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 16.0),
      pageColor: Colors.white,
      imagePadding: EdgeInsets.zero,
      bodyAlignment: Alignment.center,
    );

    return IntroductionScreen(
      globalBackgroundColor: Colors.white,
      isTopSafeArea: true,
      pages: [
        PageViewModel(
          title: 'Teach Edison',
          body:
              "An Education Technology Company Primarily focussing on accelerating the World\'s transition to Online Education.",
          image: _buildImage('assets/images/app_icon.png'),
          decoration: pageDecoration,
        ),
        PageViewModel(
          title: "Live Lecturing",
          body:
              "Simulate in-person collaboration with our advanced communication channels.",
          image: _buildImage('assets/images/app_icon.png'),
          decoration: pageDecoration,
        ),
        PageViewModel(
          title: "Support and Payment Gateway",
          body:
              "Unlimited email support, free training webinars enable you to get the most out of your cloud school.",
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
