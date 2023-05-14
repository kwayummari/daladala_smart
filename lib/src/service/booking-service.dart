import 'package:daladala_smart/src/api/apis.dart';
import 'package:flutter/material.dart';

class bookingService {
  Api api = Api();

  Future getbookings(
      BuildContext context, String date, String time) async {
    Map<String, dynamic> data = {
      'date': date.toString(),
      'time': time.toString(),
    };
    final response = await api.post(context, 'bookings/get_number.php', data);
    return response;
  }
}