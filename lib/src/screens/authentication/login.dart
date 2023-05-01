import 'package:daladala_smart/routes/route-names.dart';
import 'package:daladala_smart/src/utils/app_const.dart';
import 'package:daladala_smart/src/widgets/app_button.dart';
import 'package:daladala_smart/src/widgets/app_input_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:daladala_smart/src/service/login-services.dart';
import 'package:daladala_smart/src/widgets/app_base_screen.dart';
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
  bool marked = false;
  bool dont_show_password = true;
  bool isLoading = false;
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
                textfieldcontroller: email,
                ispassword: false,
                fillcolor: AppConst.primary,
                label: 'Email',
                obscure: false,
                icon: Icon(
                  Icons.person,
                  color: AppConst.white,
                ),
                isemail: true,
              ),
              AppInputText(
                isemail: false,
                textfieldcontroller: password,
                ispassword: true,
                fillcolor: AppConst.primary,
                label: 'Password',
                obscure: false,
                icon: Icon(
                  Icons.lock,
                  color: AppConst.white,
                ),
              ),
              Row(
                children: [
                  Spacer(),
                  Checkbox(
                    fillColor: MaterialStateProperty.resolveWith<Color?>(
                      (Set<MaterialState> states) => AppConst.primary,
                    ),
                    activeColor: AppConst.primary,
                    value: marked,
                    onChanged: (bool? value) {
                      setState(() {
                        marked = !marked;
                      });
                    },
                  ),
                  AppText(
                    txt: 'Remember me',
                    size: 15,
                    color: AppConst.white,
                  ),
                  Spacer()
                ],
              ),
              SizedBox(
                height: 20,
              ),
              isLoading == true
                  ? SpinKitCircle(
                      color: AppConst.primary,
                    )
                  : Container(
                      width: 350,
                      height: 55,
                      child: AppButton(
                        onPress: () => loginService()
                            .login(context, email.text, password.text),
                        label: 'LOGIN',
                        borderRadius: 20,
                        textColor: AppConst.white,
                        bcolor: AppConst.primary,
                      ),
                    ),
              SizedBox(
                height: 10,
              ),
              GestureDetector(
                onTap: () => null,
                child: Container(
                  width: 60,
                  height: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                      color: Colors.grey,
                      width: 2.0,
                    ),
                  ),
                  child: Image.asset(
                    'assets/google.png',
                    height: 40,
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              GestureDetector(
                onTap: () =>
                    Navigator.pushNamed(context, RouteNames.registration),
                child: RichText(
                  text: TextSpan(
                    style: TextStyle(
                      fontSize: 15,
                      color: Colors.black,
                    ),
                    children: [
                      TextSpan(
                        text: 'Don\'t have an account? ',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, color: AppConst.white),
                      ),
                      TextSpan(
                        text: 'Sign up',
                        style: TextStyle(
                          color: AppConst.primary,
                        ),
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
