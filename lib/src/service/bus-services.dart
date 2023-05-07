import 'dart:convert';
import 'package:daladala_smart/src/provider/login-provider.dart';
import 'package:daladala_smart/src/widgets/app_snackbar.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/material.dart';
import 'package:daladala_smart/routes/route-names.dart';

import '../api/apis.dart';

class loginService {
  Api api = Api();

  Future<void> login(
      BuildContext context, String email, String password) async {
    final myProvider = Provider.of<MyProvider>(context, listen: false);
    Provider.of<MyProvider>(context, listen: false)
        .updateLoging(!myProvider.myLoging);
    Map<String, dynamic> data = {
      'email': email.toString(),
      'password': password.toString(),
    };
    final response = await api.post(context, 'auth/login.php', data);
    // "0"

    return response;
  }
}
