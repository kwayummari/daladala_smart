import 'package:daladala_smart/src/utils/app_const.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:daladala_smart/src/widgets/app_text.dart';

class AppInputText extends StatelessWidget {
  final TextEditingController? textfieldcontroller;
  final String? label;
  final Icon? icon;
  final Color? fillcolor;
  final IconButton? suffixicon;
  final bool obscure;
  final Function? validate;
  final Function(String)? onChange;
  final bool isemail;
  AppInputText({
    Key? key,
    required this.textfieldcontroller,
    required this.isemail,
    required this.fillcolor,
    this.icon,
    this.suffixicon,
    this.onChange,
    required this.label,
    required this.obscure,
    this.validate,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20, left: 10, right: 10),
      child: TextFormField(
        onChanged: onChange,
        obscureText: obscure,
        obscuringCharacter: '*',
        controller: textfieldcontroller,
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20.0),
          ),
          label: AppText(
            txt: label,
            size: 15,
            color: AppConst.white,
          ),
          filled: true,
          fillColor: fillcolor,
          disabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20.0),
            borderSide: BorderSide(color: AppConst.black),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20.0),
            borderSide: BorderSide(color: AppConst.black),
          ),
          prefixIcon: icon,
          suffixIcon: suffixicon,
        ),
        validator: (value) {
          RegExp regex = RegExp(
              r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~.]).{8,}$');
          if (isemail) {
            if (value!.isNotEmpty) {
              return null;
            } else if (value.isEmpty) {
              return "THis field cannot be empty";
            } else if (!regex.hasMatch(value)) {
              return 'Password should contain \n -at least one upper case \n -at least one lower case \n -at least one digit \n -at least one Special character \n -Must be at least 8 characters in length';
            }
          } else {
            if (value!.isNotEmpty) {
              return null;
            } else if (value.isEmpty) {
              return "THis field cannot be empty";
              ;
            }
          }
        },
      ),
    );
  }
}
