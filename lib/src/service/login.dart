import 'dart:convert';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/material.dart';
import 'package:daladala_smart/routes/route-names.dart';

import '../api/login.dart';

class loginService {
  static String baseUrl = dotenv.env['API_SERVER'] ?? 'http://noapi';
  Api api = Api();

  Future<void> login(BuildContext context, String username, String password) async {
    Map<String, dynamic> data = {
      'username': username,
      'password': password,
    };
      final response = await api.post(context,'login', data);
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString('username', username);
      await prefs.setString('role', response['role']);
      Navigator.pushNamedAndRemoveUntil(
          context, RouteNames.home, (_) => false);
  }
}
