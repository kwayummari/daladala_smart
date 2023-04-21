import 'dart:convert';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/material.dart';
import 'package:daladala_smart/routes/route-names.dart';

import '../api/login.dart';

class registrationService {
  static String baseUrl = dotenv.env['API_SERVER'] ?? 'http://noapi';
  Api api = Api();

  Future<void> registration(BuildContext context, String email, String password,
      String region, String fullname) async {
    Map<String, dynamic> data = {
      'email': email,
      'fullname': fullname,
      'region': region,
      'password': password,
    };
    final response = await api.post('registration.php', data);
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('email', email);
    // await prefs.setString('role', response['role']);
    Navigator.pushNamedAndRemoveUntil(context, RouteNames.home, (_) => false);
  }
}
