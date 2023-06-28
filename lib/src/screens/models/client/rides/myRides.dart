import 'package:daladala_smart/src/widgets/app_base_screen.dart';
import 'package:flutter/material.dart';

class myRides extends StatefulWidget {
  const myRides({Key? key}) : super(key: key);

  @override
  State<myRides> createState() => _myRidesState();
}

class _myRidesState extends State<myRides> {
  @override
  Widget build(BuildContext context) {
    return AppBaseScreen(
        child: Column(
          children: [
            
          ],
        ),
        isvisible: false,
        backgroundImage: false,
        backgroundAuth: false);
  }
}
