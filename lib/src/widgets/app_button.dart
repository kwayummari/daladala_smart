import 'package:flutter/material.dart';
import 'package:daladala_smart/src/widgets/app_text.dart';

class AppButton extends StatelessWidget {
  final Function onPress;
  final String label;
  final Color bcolor;
  final double borderRadius;
  var weight;
  final Color textColor;
  double size;

   AppButton(
      {Key? key,
      required this.onPress,
      required this.label,
      required this.borderRadius,
      required this.textColor,
      this.weight,
      required this.bcolor,
      required this.size
      })
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all<Color>(bcolor),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(borderRadius),
            ),
          ),
        ),
        onPressed: () => onPress(),
        child: AppText(txt: label, color: textColor, size: size, weight: weight,));
  }
}
