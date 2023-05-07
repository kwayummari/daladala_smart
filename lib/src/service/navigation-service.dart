import 'package:daladala_smart/src/api/apis.dart';
import 'package:flutter/material.dart';

class navigationService {
  Api api = Api();
  
  Future getDestination(BuildContext context, String endPoint) async {
    final response = await api.get(context, endPoint);
    return response;
  }

  Future getdiscipline() async {
    http.Response response;
    const API_URL = 'https://daladalasmart.com/api/destination/get.php';
    response = await http.get(Uri.parse(API_URL));
    if (response.statusCode == 200) {
      if (mounted)
        setState(() {
          destinations = json.decode(response.body);
        });
    }
  }
   
  Future<void> bus(
      BuildContext context, String destination, String direction, String route) async {
    Map<String, dynamic> data = {
      'destination': destination.toString(),
      'direction': direction.toString(),
      'route': route.toString(),
    };
    final response = await api.post(context, 'bus/get.php', data);
    return response;
  }
}
