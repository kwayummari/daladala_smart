import 'package:daladala_smart/src/service/booking-service.dart';
import 'package:daladala_smart/src/service/map-serivces.dart';
import 'package:daladala_smart/src/widgets/app_base_screen.dart';
import 'package:daladala_smart/src/widgets/app_map.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

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
    getYourLocation();
    getBusLocation();
  }

  Future getYourLocation() async {
    final mapService _mapService = await mapService();
    position = await _mapService.determinePosition();
  }

  Future getBusLocation() async {
    final bookingService _bookingService = await bookingService();
    position = await _bookingService.getLiveLocation(context,widget.busNumber);
  }

  @override
  Widget build(BuildContext context) {
    return AppBaseScreen(
        child: FutureBuilder(
          future: getYourLocation(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              return Center(child: Text('Error: ${snapshot.error}'));
            } else {
              return SizedBox(
                height: MediaQuery.of(context).size.height,
                child: CustomGoogleMap(
                  initialCameraPosition:
                      LatLng(position!.latitude, position!.longitude),
                  markers: Set<Marker>.of([
                    Marker(
                      markerId: MarkerId("Your Location"),
                      position: LatLng(position!.latitude, position!.longitude),
                      icon: BitmapDescriptor.defaultMarker,
                      infoWindow: InfoWindow(
                        title: 'Your Location',
                        onTap: () => null,
                      ),
                    ),
                  ]),
                ),
              );
            }
          },
        ),
        isvisible: false,
        backgroundImage: false,
        backgroundAuth: false);
  }
}
