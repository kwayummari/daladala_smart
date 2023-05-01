import 'package:daladala_smart/src/utils/app_const.dart';
import 'package:flutter/material.dart';
import 'package:daladala_smart/src/widgets/app_text.dart';

class appMapInputtext extends StatelessWidget {
  final TextEditingController? textfieldcontroller;
  final String? label;
  final Icon? icon;
  final Color? fillcolor;
  final IconButton? suffixicon;
  final bool obscure;
  final Function? validate;
  final Function(String)? onChange;
  final bool? enabled;
  appMapInputtext({
    Key? key,
    required this.textfieldcontroller,
    required this.fillcolor,
    this.icon,
    this.suffixicon,
    this.onChange,
    required this.label,
    required this.obscure,
    this.validate,
    this.enabled,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20, left: 10, right: 10),
      child: TextFormField(
        enabled: enabled ?? true,
        style: TextStyle(color: AppConst.white),
        onChanged: onChange,
        obscureText: obscure,
        obscuringCharacter: '*',
        controller: textfieldcontroller,
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20.0),
          ),
          label: Container(
            color: AppConst.primary,
            child: AppText(
              txt: label,
              size: 15,
              color: AppConst.white,
            ),
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
            if (value!.isNotEmpty) {
              return null;
            } else if (value.isEmpty) {
              return "THis field cannot be empty";
            }
        },
      ),
    );
  }
}
