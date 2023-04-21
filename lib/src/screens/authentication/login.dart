import 'package:daladala_smart/routes/route-names.dart';
import 'package:daladala_smart/src/utils/app_const.dart';
import 'package:daladala_smart/src/widgets/app_button.dart';
import 'package:daladala_smart/src/widgets/app_input_text.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:daladala_smart/src/service/login.dart';
import 'package:daladala_smart/src/widgets/app_base_screen.dart';
import 'package:daladala_smart/src/widgets/app_text.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final loginService _apiService = loginService();
  TextEditingController username = TextEditingController();
  TextEditingController password = TextEditingController();
  bool dont_show_password = true;
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return AppBaseScreen(
      isvisible: true,
      backgroundImage: false,
      backgroundAuth: false,
      child: Form(
          key: _formKey,
          child: Column(
            children: [
              SizedBox(
                height: 90,
              ),
              Image.asset('assets/logo1.png'),
              SizedBox(
                height: 30,
              ),
              AppText(
                txt: 'WELCOME BACK',
                size: 25,
                weight: FontWeight.w400,
                color: HexColor('#ffffff'),
              ),
              SizedBox(
                height: 15,
              ),
              AppText(
                txt: 'Login into your account',
                size: 15,
                weight: FontWeight.w400,
                color: HexColor('#ffffff'),
              ),
              SizedBox(
                height: 30,
              ),
              AppInputText(
                textfieldcontroller: username,
                isemail: false,
                fillcolor: AppConst.primary,
                label: 'Username',
                obscure: false,
                icon: Icon(
                  Icons.person,
                  color: AppConst.white,
                ),
              ),
              AppInputText(
                textfieldcontroller: password,
                isemail: false,
                fillcolor: AppConst.primary,
                label: 'Password',
                obscure: false,
                icon: Icon(
                  Icons.lock,
                  color: AppConst.white,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    left: 8, right: 12, top: 8, bottom: 8),
                child: Align(
                    alignment: Alignment.centerRight,
                    child: AppText(
                      txt: 'Forgot Password?',
                      size: 15,
                      color: AppConst.white,
                    )),
              ),
              SizedBox(
                height: 100,
              ),
              Container(
                width: 350,
                height: 55,
                child: AppButton(
                    onPress: () => null,
                    label: 'LOGIN',
                    borderRadius: 20,
                    textColor: AppConst.white,
                    bcolor: AppConst.primary,
                    size: 15),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    left: 12, right: 8, top: 8, bottom: 8),
                child: GestureDetector(
                  onTap: () =>
                      Navigator.pushNamed(context, RouteNames.registration),
                  child: Row(
                    children: [
                      AppText(
                        txt: 'Don\'t have an account?',
                        size: 15,
                        color: AppConst.white,
                        weight: FontWeight.w400,
                      ),
                      AppText(
                        txt: 'Sign Up',
                        size: 15,
                        color: AppConst.white,
                        weight: FontWeight.bold,
                      ),
                    ],
                  ),
                ),
              )
            ],
          )),
    );
  }
}
