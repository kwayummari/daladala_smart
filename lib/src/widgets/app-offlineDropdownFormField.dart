import 'package:daladala_smart/src/utils/app_const.dart';
import 'package:daladala_smart/src/widgets/app_text.dart';
import 'package:flutter/material.dart';

class AppDropdownTextFormField<T> extends StatelessWidget {
  final String labelText;
  final List<T> options;
  final T value;
  final void Function(T?)? onChanged;

  AppDropdownTextFormField({
    required this.labelText,
    required this.options,
    required this.value,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: InputDecorator(
        decoration: InputDecoration(
          filled: true,
          fillColor: AppConst.white,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20.0),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20.0),
            borderSide: BorderSide(color: AppConst.primary),
          ),
        ),
        child: DropdownButtonHideUnderline(
          child: DropdownButton<T>(
            value: value,
            hint: AppText(txt: labelText, color: AppConst.black, size: 15,),
            isDense: true,
            onChanged: onChanged,
            items: [
              ...options.map((T option) {
                return DropdownMenuItem<T>(
                  value: option,
                  child: AppText(txt: option.toString(), size: 15, color: AppConst.black,),
                );
              }).toList(),
            ],
          ),
        ),
      ),
    );
  }
}
