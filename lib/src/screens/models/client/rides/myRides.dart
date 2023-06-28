import 'package:daladala_smart/src/service/bus-services.dart';
import 'package:daladala_smart/src/widgets/app_base_screen.dart';
import 'package:flutter/material.dart';

class myRides extends StatefulWidget {
  const myRides({Key? key}) : super(key: key);

  @override
  State<myRides> createState() => _myRidesState();
}

class _myRidesState extends State<myRides> {
  late Future<List> _futureBusList;

  @override
  void initState() {
    super.initState();
    _futureBusList = getBuses();
  }

  Future<List> getBuses() async {
    final busService _busesService = await busService();
    final List busesList = await _busesService.getBusById(
        context);
    return busesList;
  }
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
