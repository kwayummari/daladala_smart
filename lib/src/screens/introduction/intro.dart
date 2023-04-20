import 'package:daladala_smart/src/screens/introduction/slides.dart';
import 'package:flutter/material.dart';
import 'package:intro_slider/intro_slider.dart';

class IntroScreen extends StatefulWidget {
  const IntroScreen({Key? key}) : super(key: key);

  @override
  _IntroScreenState createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {
  final PageController _pageController = PageController(initialPage: 0);
  final List<Slide> slides = [
    Slide(
      title: "Welcome to MyApp",
      description: "MyApp is an awesome app that does amazing things!",
      backgroundColor: Colors.redAccent,
    ),
    Slide(
      title: "Explore the Features",
      description:
          "MyApp has a lot of cool features that you will love to explore!",
    ),
    Slide(
      title: "Start Using MyApp",
      description:
          "Are you ready to start using MyApp and see what it can do for you?",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return IntroSlider(
      renderDoneBtn: Text("Done"),
      renderNextBtn: Text("Next"),
      renderSkipBtn: Text("Skip"),
      listCustomTabs: slides
    );
  }
}
