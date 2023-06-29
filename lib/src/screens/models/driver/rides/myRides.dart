import 'package:daladala_smart/src/service/bus-services.dart';
import 'package:daladala_smart/src/widgets/app_base_screen.dart';
import 'package:daladala_smart/src/widgets/app_driver_bus_card.dart';
import 'package:flutter/material.dart';

class driverMyRides extends StatefulWidget {
  const driverMyRides({Key? key}) : super(key: key);

  @override
  State<driverMyRides> createState() => _driverMyRidesState();
}

class _driverMyRidesState extends State<driverMyRides> {
  late Future<List> _futureBusList;

  @override
  void initState() {
    super.initState();
    _futureBusList = getBuses();
  }

  List details = [];
  Future<List> getBuses() async {
    final busService _busesService = await busService();
    final List busesList = await _busesService.getBusById(context);
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
                  return driverBusCard(
                      busNumber: details[index]['number'],
                      userName: details[index]['user_name'],
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
