import 'dart:math';

import 'package:daladala_smart/src/utils/app_const.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class CustomGoogleMap extends StatefulWidget {
  final LatLng initialCameraPosition;
  final Set<Marker> markers;

  CustomGoogleMap({
    required this.initialCameraPosition,
    required this.markers,
  });

  @override
  _CustomGoogleMapState createState() => _CustomGoogleMapState();
}

class _CustomGoogleMapState extends State<CustomGoogleMap> {
  bool _mapLoaded = false;
  GoogleMapController? _mapController;
  Set<Polyline> _polylines = {};

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        GoogleMap(
          initialCameraPosition:
              CameraPosition(target: widget.initialCameraPosition, zoom: 16),
          markers: widget.markers,
          polylines: _polylines,
          onMapCreated: (GoogleMapController controller) {
            setState(() {
              _mapLoaded = true;
              _mapController = controller;
            });
            controller.setMapStyle("mapbox://styles/mapbox/82cd04a44b2dbc35");
          },
        ),
        if (!_mapLoaded)
          Container(
            color: Colors.grey[300],
            child: Center(
              child: SpinKitCircle(
                color: AppConst.primary,
              ),
            ),
          ),
      ],
    );
  }

  // Fetch and display the route between markers
  Future<void> getRoute(LatLng start, LatLng end) async {
    // Send request to Directions API
    var apiKey = 'AIzaSyBH7beAoWGUJcMbG7j5e365zG6vzfQFyE8';
    var response = await http.get(Uri.parse(
        'https://maps.googleapis.com/maps/api/directions/json?origin=${start.latitude},${start.longitude}&destination=${end.latitude},${end.longitude}&key=$apiKey'));

    // Parse the response JSON
    var decoded = json.decode(response.body);
    List<dynamic> routes = decoded['routes'];

    if (routes.isNotEmpty) {
      // Extract the polyline coordinates from the response
      List<LatLng> polylineCoordinates =
          _decodePolyline(routes[0]['overview_polyline']['points']);

      // Create the route polyline
      Polyline routePolyline = Polyline(
        polylineId: PolylineId('route'),
        points: polylineCoordinates,
        color: Colors.blue,
        width: 5,
      );

      // Update the markers and polylines on the map
      setState(() {
        _polylines = {routePolyline};
      });

      // Adjust the camera bounds to show the markers and route
      LatLngBounds bounds = LatLngBounds(
        southwest: LatLng(
          min(start.latitude, end.latitude),
          min(start.longitude, end.longitude),
        ),
        northeast: LatLng(
          max(start.latitude, end.latitude),
          max(start.longitude, end.longitude),
        ),
      );
      _mapController!.animateCamera(CameraUpdate.newLatLngBounds(bounds, 100));
    }
  }

  // Decode polyline encoded string into list of coordinates
  List<LatLng> _decodePolyline(String encodedPolyline) {
    List<LatLng> polylineCoordinates = <LatLng>[];
    int index = 0;
    int latitude = 0;
    int longitude = 0;

    while (index < encodedPolyline.length) {
      int byte;
      int shift = 0;
      int result = 0;

      do {
        byte = encodedPolyline.codeUnitAt(index++) - 63;
        result |= (byte & 0x1F) << shift;
        shift += 5;
      } while (byte >= 0x20);

      int deltaLatitude = ((result & 1) == 1 ? ~(result >> 1) : (result >> 1));
      latitude += deltaLatitude;

      shift = 0;
      result = 0;

      do {
        byte = encodedPolyline.codeUnitAt(index++) - 63;
        result |= (byte & 0x1F) << shift;
        shift += 5;
      } while (byte >= 0x20);

      int deltaLongitude = ((result & 1) == 1 ? ~(result >> 1) : (result >> 1));
      longitude += deltaLongitude;

      double finalLat = latitude / 1E5;
      double finalLng = longitude / 1E5;
      LatLng point = LatLng(finalLat, finalLng);
      polylineCoordinates.add(point);
    }

    return polylineCoordinates;
  }
}
