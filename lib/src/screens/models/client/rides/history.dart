import 'package:daladala_smart/src/service/bus-services.dart';
import 'package:daladala_smart/src/widgets/app_base_screen.dart';
import 'package:daladala_smart/src/widgets/app_bus_card.dart';
import 'package:flutter/material.dart';

class history extends StatefulWidget {
  const history({Key? key}) : super(key: key);

  @override
  State<history> createState() => _historyState();
}

class _historyState extends State<history> {
  @override
  void initState() {
    super.initState();
    getBuses();
  }

  List details = [];
  Future<List> getBuses() async {
    final busService _busesService = await busService();
    final List busesList = await _busesService.getBusById(context,'1');
    setState(() {
      details = busesList;
    });
    print(details);
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
                      image: details[index]['image'], isHistory: true,);
                },
                itemCount: details.length != 0 ? details.length : null,
              ),
        isvisible: false,
        backgroundImage: false,
        backgroundAuth: false);
  }
}
