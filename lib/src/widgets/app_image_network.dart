import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class appNetworkImage extends StatelessWidget {
  final String endPoint;
  const appNetworkImage({Key? key, required this.endPoint}) : super(key: key);
  static String baseUrl = dotenv.env['API_SERVER'] ?? 'http://noapi';
  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: 20,
      backgroundImage:
          NetworkImage('${baseUrl}/${endPoint}'), // Replace with your image URL
    );
  }
}
