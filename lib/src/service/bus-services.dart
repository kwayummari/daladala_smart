import 'package:daladala_smart/src/api/apis.dart';
import 'package:daladala_smart/src/functions/splash.dart';
import 'package:flutter/material.dart';

class busService {
  Api api = Api();

  Future getBus(
      BuildContext context, String destination, String direction, String route) async {
    Map<String, dynamic> data = {
      'destination': destination.toString(),
      'direction': direction.toString(),
      'route': route.toString(),
    };
    final response = await api.post(context, 'bus/get.php', data);
    return response;
  }
  Future getBusById(
      BuildContext context) async {
        final SplashFunction _splashService = await SplashFunction();
    final String id = await _splashService.getId();
    Map<String, dynamic> data = {
      'id': id.toString(),
    };
    final response = await api.post(context, 'bus/get.php', data);
    return response;
  }
}
