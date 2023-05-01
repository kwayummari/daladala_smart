import 'dart:convert';
import 'package:daladala_smart/src/provider/login-provider.dart';
import 'package:daladala_smart/src/widgets/app_snackbar.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/material.dart';
import 'package:daladala_smart/routes/route-names.dart';

import '../api/apis.dart';

class loginService {
  static String baseUrl = dotenv.env['API_SERVER'] ?? 'http://noapi';
  Api api = Api();

  Future<void> login(
      BuildContext context, String email, String password) async {
        final myProvider = Provider.of<MyProvider>(context);
    Map<String, dynamic> data = {
      'email': email.toString(),
      'password': password.toString(),
    };
    final response = await api.post(context, 'auth/login.php', data);
    // "0"

    if (response != 'wrong') {
      myProvider.updateLoging(!myProvider.myLoging);
      List<String> splitResponse = response.split("-");
      String id = splitResponse[0]; // "1"
      String role = splitResponse[1];
      if (role == '0') {
        final prefs = await SharedPreferences.getInstance();
        await prefs.setString('email', email);
        await prefs.setString('id', id.toString());
        await prefs.setString('role', role.toString());
        Navigator.pushNamedAndRemoveUntil(
            context, RouteNames.dashboard, (_) => false);
      }
    } else {
      myProvider.updateLoging(!myProvider.myLoging);
      AppSnackbar(
        isError: true,
        response: 'Wrong username or password',
      ).show(context);
    }
  }
}
