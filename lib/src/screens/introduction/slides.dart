import 'package:flutter/material.dart';
class Slide extends StatelessWidget {
  final String title;
  final String description;
  final String imagePath;
  final Color backgroundColor;

   Slide({
    Key? key,
    required this.title,
    required this.description,
    required this.imagePath,
    required this.backgroundColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}