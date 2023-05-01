import 'dart:convert';
import 'package:daladala_smart/src/api/apis.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter/material.dart';


class loginService {
  static String baseUrl = dotenv.env['API_SERVER'] ?? 'http://noapi';
  Api api = Api();

  Future<void> login(
      BuildContext context, String endPoint) async {
    final response = await api.get(context, endPoint);
  }
}
