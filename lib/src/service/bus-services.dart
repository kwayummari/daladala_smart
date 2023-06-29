import 'package:daladala_smart/src/api/apis.dart';
import 'package:daladala_smart/src/functions/splash.dart';
import 'package:flutter/material.dart';

class busService {
  Api api = Api();

  Future getBus(BuildContext context, String destination, String direction,
      String route) async {
    Map<String, dynamic> data = {
      'destination': destination.toString(),
      'direction': direction.toString(),
      'route': route.toString(),
    };
    final response = await api.post(context, 'bus/get.php', data);
    return response;
  }

  Future getBusById(BuildContext context, String status) async {
    final SplashFunction _splashService = await SplashFunction();
    final String id = await _splashService.getId();
    Map<String, dynamic> data = {
      'id': id.toString(),
      'status': status.toString(),
    };
    final response = await api.post(context, 'bookings/get_by_id.php', data);
    return response;
  }

  Future getBusByDriverId(BuildContext context) async {
    final SplashFunction _splashService = await SplashFunction();
    final String id = await _splashService.getId();
    Map<String, dynamic> data = {
      'id': id.toString(),
    };
    final response =
        await api.post(context, 'bookings/get_by_driver_id.php', data);
    final responses =
        await api.post(context, 'bookings/get_by_conductor_id.php', data);
    return response == null ? responses : response;
  }
}
