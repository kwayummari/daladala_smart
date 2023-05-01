import 'package:daladala_smart/src/widgets/app_base_screen.dart';
import 'package:flutter/material.dart';

class rides extends StatefulWidget {
  const rides({super.key});

  @override
  State<rides> createState() => _ridesState();
}

class _ridesState extends State<rides> {
  @override
  Widget build(BuildContext context) {
    return AppBaseScreen(
      isvisible: true,
      backgroundImage: false,
      backgroundAuth: false,
      child: Container());
  }
}