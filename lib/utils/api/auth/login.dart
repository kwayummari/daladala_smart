import 'dart:convert';

import 'package:daladala_smart/utils/providers/shareddate_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
class loginAuth {
  var language;
  getValidationData() {
    return language = SharedData().language.toString();
  }

  Future login(
      BuildContext context, String username, String password, language) async {
    const url = '${dotenv.env['API_KEY']}authentication/login.php';
    var response = await http.post(Uri.parse(url), body: {
      "username": username.toString(),
      "password": password.toString(),
    });
    var data = jsonDecode(response.body);
    if (data == "inactive") {
      await done(context);
      Fluttertoast.showToast(
        msg: language == 'Kiswahili'
            ? 'Akaunti yako haijathibitishwa'
            : 'Your account needs activation',
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 15.0,
      );
    } else if (data == "Health Care Providers") {
      await done(context);
      // Navigator.of(context).pushReplacement(
      //     MaterialPageRoute(builder: (context) => Homepage_hcp('')));
      final SharedPreferences sharedPreferences =
          await SharedPreferences.getInstance();
      sharedPreferences.setString('username', username.toString());
      sharedPreferences.setString('status', 'Health Care Providers');
      Fluttertoast.showToast(
        msg: language == 'Kiswahili'
            ? 'Umefanikiwa Kuingia'
            : 'Login Succefully',
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.green,
        textColor: Colors.white,
        fontSize: 15.0,
      );
    } else if (data == "wrong") {
      await done(context);
      Fluttertoast.showToast(
        msg: language == 'Kiswahili'
            ? 'Umekosea Jina au Nywila'
            : 'Invalid Username or Password',
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 15.0,
      );
    } else {
      await done(context);
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();
    sharedPreferences.setString('username', username.toString());
    sharedPreferences.setString('status', '${data}');
    Fluttertoast.showToast(
      msg: language == 'Kiswahili' ? 'Umefanikiwa Kuingia' : 'Login Succefully',
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.CENTER,
      timeInSecForIosWeb: 1,
      backgroundColor: Colors.green,
      textColor: Colors.white,
      fontSize: 15.0,
    );
    // Navigator.of(context)
    //     .pushReplacement(MaterialPageRoute(builder: (context) => Homepage('')));
  } }

  done(BuildContext context) async {
    await Future.delayed(Duration(seconds: 5), () {
      final isloading = Provider.of<SharedData>(context, listen: false);
      isloading.isLoading = false;
    });
  }
}
