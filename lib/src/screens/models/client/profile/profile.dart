import 'package:daladala_smart/src/functions/splash.dart';
import 'package:daladala_smart/src/service/profile-service.dart';
import 'package:daladala_smart/src/widgets/app_base_screen.dart';
import 'package:flutter/material.dart';

class profile extends StatefulWidget {
  const profile({super.key});

  @override
  State<profile> createState() => _profileState();
}

class _profileState extends State<profile> {
  var email;
  var id;
  var role;
  List profileData = [];
  @override
  void initState() {
    super.initState();
    getHome();
  }

  Future getHome() async {
    final SplashFunction _splashService = await SplashFunction();
    final profileService profile = await profileService();
    setState(() {
      email = _splashService.email;
      id = _splashService.id;
      role = _splashService.role;
    });
  }

  @override
  Widget build(BuildContext context) {
    return AppBaseScreen(
        isvisible: true,
        backgroundImage: false,
        backgroundAuth: false,
        child: Container());
  }
}
