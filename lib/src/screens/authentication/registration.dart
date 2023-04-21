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
                height: 90,
              ),
              Padding(
                padding: const EdgeInsets.only(
                    left: 16, right: 16, bottom: 16, top: 16),
                child: Image.asset('assets/logo1.png'),
              ),
              SizedBox(
                height: 130,
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
                        height: 30,
                      ),
                      Container(
                        width: 350,
                        height: 55,
                        child: AppButton(
                            onPress: () => null,
                            label: 'SIGN UP',
                            borderRadius: 20,
                            textColor: AppConst.white,
                            bcolor: AppConst.primary,
                            size: 15),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            left: 12, right: 8, top: 8, bottom: 8),
                        child: GestureDetector(
                          onTap: () => Navigator.pushNamed(
                              context, RouteNames.registration),
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
                                color: AppConst.white,
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
