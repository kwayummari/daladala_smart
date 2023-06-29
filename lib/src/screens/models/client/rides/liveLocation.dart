import 'package:daladala_smart/src/widgets/app_base_screen.dart';
import 'package:flutter/material.dart';

class liveLocation extends StatefulWidget {
  final String busNumber;
  const liveLocation({
    required this.busNumber,
  });

  @override
  State<liveLocation> createState() => _liveLocationState();
}

class _liveLocationState extends State<liveLocation> {
  @override
  Widget build(BuildContext context) {
    return AppBaseScreen(
        child: Column(
          children: [],
        ),
        isvisible: false,
        backgroundImage: false,
        backgroundAuth: false);
  }
}
