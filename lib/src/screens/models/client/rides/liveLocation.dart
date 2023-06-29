import 'package:daladala_smart/src/service/map-serivces.dart';
import 'package:daladala_smart/src/widgets/app_base_screen.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

class liveLocation extends StatefulWidget {
  final String busNumber;
  const liveLocation({
    required this.busNumber,
  });

  @override
  State<liveLocation> createState() => _liveLocationState();
}

class _liveLocationState extends State<liveLocation> {
  Position? position;
  @override
  void initState() {
    super.initState();
    getHome();
  }
  Future getHome() async {
    final mapService _mapService = await mapService();
    position = await _mapService.determinePosition();
  }
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
