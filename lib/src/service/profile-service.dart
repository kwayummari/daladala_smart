import 'package:daladala_smart/src/api/apis.dart';
import 'package:flutter/material.dart';

class profileService {
  Api api = Api();
  Future profile(BuildContext context, String id) async {
    Map<String, dynamic> data = {
        'id': id.toString(),
      };
    final response = await api.post(context, 'profile/get.php', data);
    return response;
  }
}
