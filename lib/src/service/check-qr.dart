import 'package:daladala_smart/src/api/apis.dart';
import 'package:daladala_smart/src/functions/splash.dart';
import 'package:daladala_smart/src/utils/app_const.dart';
import 'package:daladala_smart/src/widgets/app_snackbar.dart';
import 'package:daladala_smart/src/widgets/app_text.dart';
import 'package:flutter/material.dart';

class qrService {
  Api api = Api();

  Future getQr(BuildContext context, String id, String date) async {
    final SplashFunction _splashFunction = await SplashFunction();
    var user_id = await _splashFunction.getId();
    Map<String, dynamic> data = {
      'id': id.toString(),
      'date': date.toString(),
      'user_id': user_id.toString(),
    };
    final response = await api.post(context, 'bookings/qr.php', data);
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: AppConst.white,
        title: AppText(
          txt: 'Results of QR Code',
          size: 20,
          weight: FontWeight.bold,
          color: AppConst.black,
        ),
        content: AppText(
          txt: response,
          size: 15,
          color: AppConst.black,
          weight: FontWeight.bold,
        ),
        actions: [
          (response != 'success')
              ? Icon(
                  Icons.cancel,
                  color: Colors.red,
                  size: 100,
                )
              : CircleAvatar(
                  radius: 50,
                  backgroundColor: AppConst.primary,
                  child: Icon(
                    Icons.done,
                    color: AppConst.white,
                    size: 50,
                  ),
                ),
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: AppText(
              txt: 'OK',
              size: 20,
              color: AppConst.black,
              weight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
    return response;
  }
}
