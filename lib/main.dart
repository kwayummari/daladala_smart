// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:responsive_framework/responsive_wrapper.dart';
import 'package:responsive_framework/utils/scroll_behavior.dart';
import 'package:daladala_smart/routes/routes.dart';
import 'package:daladala_smart/routes/route-names.dart';

Future main() async {
  await dotenv.load(fileName: ".env");
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  runApp(
     const MyApp()
    );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) =>  MaterialApp(
    initialRoute: RouteNames.splash,
      routes: routes,
      builder: (context, widget) => ResponsiveWrapper.builder(
            ClampingScrollWrapper.builder(context, widget!),
            breakpoints: const [
              ResponsiveBreakpoint.resize(480, name: MOBILE),
              ResponsiveBreakpoint.autoScale(800, name: TABLET),
              ResponsiveBreakpoint.resize(1000, name: DESKTOP),
              ResponsiveBreakpoint.autoScale(1700, name: 'XL'),
              ResponsiveBreakpoint.autoScale(2460, name: '4K'),
            ],
          ),
      debugShowCheckedModeBanner: false,
      title: 'DALADALA SMART',
      theme: ThemeData(
          // timePickerTheme: Theme.of(context).primaryColor,
          cardColor: Colors.green.shade400,
          highlightColor: Colors.green.shade400,
          splashColor: Colors.green.shade400,
          primaryColor: Colors.green.shade700,
          visualDensity: VisualDensity.adaptivePlatformDensity,
           colorScheme: ColorScheme.fromSwatch(
            primarySwatch: Colors.green,
            ).copyWith(background: Colors.green.shade400)),);
}
