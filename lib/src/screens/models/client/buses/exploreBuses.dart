import 'package:daladala_smart/src/screens/models/client/buses/view.dart';
import 'package:daladala_smart/src/service/exploreBusesDetails-service.dart';
import 'package:daladala_smart/src/utils/app_const.dart';
import 'package:daladala_smart/src/widgets/app_base_screen.dart';
import 'package:daladala_smart/src/widgets/app_text.dart';
import 'package:flutter/material.dart';

class exploreBuses extends StatefulWidget {
  var id;
   exploreBuses({Key? key, required this.id}) : super(key: key);

  @override
  State<exploreBuses> createState() => _exploreBusesState();
}

class _exploreBusesState extends State<exploreBuses> {
  late Future<List> _futureBusDetailsList;
  @override
  void initState() {
    super.initState();
    // _futureBusDetailsList = getBusesDetails();
    getBusesDetails();
  }
  List details = [];
  Future<List> getBusesDetails() async {
    final busDetailsService _busesDetailsService = await busDetailsService();
    final List busesDetailsList = await _busesDetailsService.getBusDetails(
        context, widget.id);
    setState(() {
      details = busesDetailsList;
    });
    return busesDetailsList;
  }
  @override
  Widget build(BuildContext context) {
    return AppBaseScreen(
        child: viewBusDetails(driver: details[0]['driver_name'], conductor: details[0]['conductor_name'], number_of_seat: details[0]['number_of_seat'], bus_type: details[0]['bus_type'], owner: details[0]['owner'], image: details[0]['image']),
        isvisible: false,
        backgroundImage: false,
        backgroundAuth: false,
    );
  }
}
