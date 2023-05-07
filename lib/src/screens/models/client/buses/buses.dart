import 'package:daladala_smart/src/service/bus-services.dart';
import 'package:daladala_smart/src/utils/app_const.dart';
import 'package:daladala_smart/src/widgets/app_base_screen.dart';
import 'package:daladala_smart/src/widgets/app_text.dart';
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
  void initState() {
    super.initState();
    getBuses();
  }

  List buses = [];
  Future<void> getBuses() async {
    final busService _busesService = await busService();
    final List busesList = await _busesService.getBus(
        context, widget.destination, widget.dire, widget.route);
    setState(() {
      this.buses = busesList;
    });
  }

  @override
  Widget build(BuildContext context) {
    return AppBaseScreen(
        child: Column(
          children: [
            SizedBox(
              height: 100,
            ),
            AppText(
              txt: widget.destination,
              size: 15,
              color: AppConst.white,
            ),
          ],
        ),
        isvisible: false,
        backgroundImage: false,
        backgroundAuth: false);
  }
}
