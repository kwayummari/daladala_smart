import 'package:daladala_smart/src/provider/login-provider.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import '../api/apis.dart';

class busService {
  Api api = Api();

  Future<void> bus(
      BuildContext context, String destination, String direction, String route) async {
    final myProvider = Provider.of<MyProvider>(context, listen: false);
    Map<String, dynamic> data = {
      'destination': destination.toString(),
      'direction': direction.toString(),
      'route': route.toString(),
    };
    final response = await api.post(context, 'bus/get.php', data);
    return response;
  }
}
