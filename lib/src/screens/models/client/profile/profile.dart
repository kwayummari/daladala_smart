import 'package:daladala_smart/src/widgets/app_base_screen.dart';
import 'package:flutter/material.dart';

class profile extends StatefulWidget {
  const profile({super.key});

  @override
  State<profile> createState() => _profileState();
}

class _profileState extends State<profile> {
  @override
  Widget build(BuildContext context) {
    return AppBaseScreen(
      isvisible: true,
      backgroundImage: false,
      backgroundAuth: false,
      child: Container());
  }
}