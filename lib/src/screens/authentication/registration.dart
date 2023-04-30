import 'package:daladala_smart/src/utils/app_const.dart';
import 'package:flutter/material.dart';
import 'package:daladala_smart/routes/route-names.dart';
import 'package:daladala_smart/src/service/registration.dart';
import 'package:daladala_smart/src/widgets/app_base_screen.dart';
import 'package:daladala_smart/src/widgets/app_button.dart';
import 'package:daladala_smart/src/widgets/app_input_text.dart';
import 'package:daladala_smart/src/widgets/app_text.dart';

class Registration extends StatefulWidget {
  const Registration({super.key});

  @override
  State<Registration> createState() => _RegistrationState();
}

class _RegistrationState extends State<Registration> {
  final registrationService _apiService = registrationService();
  TextEditingController username = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController rpassword = TextEditingController();
  bool dont_show_password = true;
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return AppBaseScreen(
      padding: const EdgeInsets.all(0),
      isvisible: true,
      backgroundImage: false,
      backgroundAuth: true,
      child: Form(
          key: _formKey,
          child: Column(
            children: [
              SizedBox(
                height: 80,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 16, right: 16, top: 16),
                child: Image.asset('assets/logo1.png'),
              ),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: AppText(
                    txt: 'Create your \n Account',
                    size: 30,
                    weight: FontWeight.w900,
                    color: AppConst.white,
                  ),
                ),
              ),
              SizedBox(
                height: 12,
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                decoration: BoxDecoration(color: AppConst.black),
                child: Padding(
                  padding: const EdgeInsets.only(left: 16, right: 16),
                  child: Column(
                    children: [
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
                          textfieldcontroller: email,
                          isemail: true,
                          fillcolor: AppConst.primary,
                          label: 'Email',
                          obscure: false),
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
                      AppInputText(
                        textfieldcontroller: rpassword,
                        isemail: false,
                        fillcolor: AppConst.primary,
                        label: 'Password',
                        obscure: false,
                        icon: Icon(
                          Icons.lock,
                          color: AppConst.white,
                        ),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Container(
                        width: 350,
                        height: 55,
                        child: AppButton(
                          onPress: () => registrationService().registration(
                              context,
                              email.text,
                              password.text,
                              rpassword.text,
                              username.text),
                          label: 'SIGN UP',
                          borderRadius: 20,
                          textColor: AppConst.white,
                          bcolor: AppConst.primary,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            left: 12, right: 8, top: 8, bottom: 8),
                        child: GestureDetector(
                          onTap: () =>
                              Navigator.pushNamed(context, RouteNames.login),
                          child: Row(
                            children: [
                              AppText(
                                txt: 'Already have an account?',
                                size: 15,
                                color: AppConst.white,
                                weight: FontWeight.w400,
                              ),
                              AppText(
                                txt: 'Sign In',
                                size: 15,
                                color: AppConst.primary,
                                weight: FontWeight.bold,
                              ),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              )
            ],
          )),
    );
  }
}
