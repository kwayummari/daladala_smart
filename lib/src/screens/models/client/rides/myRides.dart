import 'package:daladala_smart/src/service/bus-services.dart';
import 'package:daladala_smart/src/widgets/app_base_screen.dart';
import 'package:daladala_smart/src/widgets/app_bus_card.dart';
import 'package:flutter/material.dart';

class myRides extends StatefulWidget {
  const myRides({Key? key}) : super(key: key);

  @override
  State<myRides> createState() => _myRidesState();
}

class _myRidesState extends State<myRides> {
  @override
  void initState() {
    super.initState();
    getBuses();
  }

  List details = [];
  Future<List> getBuses() async {
    final busService _busesService = await busService();
    final List busesList = await _busesService.getBusById(context, '0');
    setState(() {
      details = busesList;
    });
    return busesList;
  }

  @override
  Widget build(BuildContext context) {
    return AppBaseScreen(
        child: details.isEmpty
            ? Container()
            : ListView.builder(
                physics: const BouncingScrollPhysics(),
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return busCard(
                      busNumber: details[index]['number'],
                      driverName: details[index]['driver_name'] as String,
                      conductorName: details[index]['conductor_name'],
                      numberOfSeats: details[index]['seat'],
                      busType: details[index]['bus_type'],
                      busOwner: details[index]['owner'],
                      time: details[index]['time'],
                      date: details[index]['date'],
                      image: details[index]['image']);
                },
                itemCount: details.length != 0 ? details.length : null,
              ),
        isvisible: false,
        backgroundImage: false,
        backgroundAuth: false);
  }
}
