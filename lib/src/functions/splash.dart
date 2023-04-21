import 'package:daladala_smart/routes/route-names.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashFunction {
  var username;
  var status;
  var language;
  var intro;

  Future navigatorToHome(context) async {
    await getValidationData();

    await Future.delayed(Duration(seconds: 1), () {});

    if (intro == null) {
      Navigator.pushNamed(context, RouteNames.intro);
    } else {
      if (username == null && status == null) {
        Navigator.pushNamed(context, RouteNames.login);
      } else if (username != null &&
          (status == 'client' ||
              status == 'Community Based Mobilizers' ||
              status == 'admin' ||
              status == 'super-admin') &&
          language != null) {
        Navigator.pushNamed(context, RouteNames.login);
      } else if (username != null &&
          status == 'Health Care Providers' &&
          language != null) {
        Navigator.pushNamed(context, RouteNames.login);
      }
    }
  }

  Future<void> getValidationData() async {
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();
    var u = sharedPreferences.getString('username');
    var l = sharedPreferences.getString('language');
    var s = sharedPreferences.getString('status');
    var i = sharedPreferences.getString('intro');

    language = l;
    username = u;
    status = s;
    intro = i;
  }
}
