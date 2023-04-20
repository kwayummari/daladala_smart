import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:daladala_smart/routes/route-names.dart';
import 'package:daladala_smart/src/service/login.dart';
import 'package:daladala_smart/src/widgets/app_base_screen.dart';
import 'package:daladala_smart/src/widgets/app_button.dart';
import 'package:daladala_smart/src/widgets/app_card.dart';
import 'package:daladala_smart/src/widgets/app_container.dart';
import 'package:daladala_smart/src/widgets/app_input_text.dart';
import 'package:daladala_smart/src/widgets/app_text.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final loginService _apiService = loginService();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  bool dont_show_password = true;
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return AppBaseScreen(
      child: Form(
          key: _formKey,
          child: Column(
            children: [
              Image.asset('assets/logo.png'),
              SizedBox(
                height: 20,
              ),
            ],
          )),
    );
  }
}
