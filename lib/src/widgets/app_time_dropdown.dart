import 'package:daladala_smart/src/utils/app_const.dart';
import 'package:daladala_smart/src/widgets/app_text.dart';
import 'package:flutter/material.dart';

class AppDropdownTimeTextFormField extends StatelessWidget {
  final String labelText;
  final List<Map<String, dynamic>> options;
  final String? selectedTimeline;
  final void Function(String?)? onChanged;

  AppDropdownTimeTextFormField({
    required this.labelText,
    required this.options,
    required this.selectedTimeline,
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
          child: DropdownButton<String>(
            value: selectedTimeline,
            hint: AppText(txt: labelText, color: AppConst.black, size: 15,),
            isDense: true,
            onChanged: onChanged,
            items: options.map((option) {
              final id = option['id'];
              final timeline = option['timeline'];

              return DropdownMenuItem<String>(
                value: timeline,
                child: AppText(txt: timeline, size: 15, color: AppConst.black,),
              );
            }).toList(),
          ),
        ),
      ),
    );
  }
}
