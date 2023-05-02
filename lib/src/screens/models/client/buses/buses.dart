import 'package:daladala_smart/src/widgets/app_base_screen.dart';
import 'package:flutter/material.dart';

class buses extends StatefulWidget {
  var destination;
  var dire;
  var route;
  buses({
    Key? key,
    required this.destination,
    required this.dire,
    required this.route,
  }) : super(key: key);

  @override
  State<buses> createState() => _busesState();
}

class _busesState extends State<buses> {
  @override
  Widget build(BuildContext context) {
    return AppBaseScreen(
        child: Container(),
        isvisible: true,
        backgroundImage: false,
        backgroundAuth: false);
  }
}
