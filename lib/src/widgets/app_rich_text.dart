import 'package:daladala_smart/src/utils/app_const.dart';
import 'package:flutter/material.dart';

class richText extends StatelessWidget {
  // final Widget child;
  final String? header;
  final String? trailer;
  TextDecoration? textdecoration;
  richText({
    Key? key,
    required this.header,
    required this.trailer,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        children: [
          TextSpan(
            text: header,
            style: TextStyle(
                color: AppConst.white,
                fontWeight: FontWeight.bold,
                fontSize: 16),
          ),
          TextSpan(
            text: trailer,
            style: TextStyle(color: AppConst.white, fontSize: 16),
          ),
        ],
      ),
    );
  }
}
