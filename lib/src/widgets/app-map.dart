import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class CustomGoogleMap extends StatelessWidget {
  final LatLng initialCameraPosition;
  final Set<Marker> markers;

  CustomGoogleMap({
    required this.initialCameraPosition,
    required this.markers,
  });

  @override
  Widget build(BuildContext context) {
    return GoogleMap(
      initialCameraPosition:
          CameraPosition(target: initialCameraPosition, zoom: 16),
      markers: markers,
      // mapType: MapType.satellite,
      onMapCreated: (GoogleMapController controller) {
        controller.setMapStyle("mapbox://styles/mapbox/82cd04a44b2dbc35");
      },
    );
  }
}
