import 'package:daladala_smart/src/screens/introduction/intro.dart';
import 'package:flutter/material.dart';
import 'package:daladala_smart/src/screens/authentication/login.dart';
import 'package:daladala_smart/src/screens/authentication/registration.dart';
import 'package:daladala_smart/src/screens/splash/splash.dart';
import 'package:daladala_smart/routes/route-names.dart';


final Map<String, WidgetBuilder> routes = {
  RouteNames.login: (context) => Login(),
  RouteNames.registration: (context) => Registration(),
  RouteNames.splash: (context) => Splash(),
  RouteNames.intro: (context) => IntroScreen(),
};