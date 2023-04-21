import 'dart:convert';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:dio/dio.dart';

class Api {
  static String baseUrl = dotenv.env['API_SERVER'] ?? 'http://noapi';

  final Dio _dio = Dio(BaseOptions(
    connectTimeout: Duration(seconds: 5000), //5s
    receiveTimeout: Duration(seconds: 5000),
    sendTimeout: Duration(seconds: 5000),
  ));

  // Throw an error if the response is not successful
  void _handleError(Response response) {
    if (response.statusCode != 200) {
      throw Exception("Failed to fetch data");
    }
  }

  // Check for internet connection
  Future<bool> hasInternetConnection() async {
    try {
      Response response = await _dio.head(baseUrl);
      return response.statusCode == 200;
    } catch (e) {
      return false;
    }
  }

  // GET Request
  Future<dynamic> get(String endPoint) async {
    if (!(await hasInternetConnection())) {
      throw Exception("No internet connection");
    }
    try {
      Response response = await _dio.get("$baseUrl/$endPoint");
      _handleError(response);
      return json.decode(response.toString());
    } catch (e) {
      throw Exception("Failed to fetch data");
    }
  }

  // POST Request
  Future<dynamic> post(String endPoint, Map<String, dynamic> data) async {
    // if (!(await hasInternetConnection())) {
    //   throw Exception("No internet connection");
    // }
    // try {
    Response response = await _dio.post("$baseUrl/$endPoint", data: data);
    _handleError(response);
    return json.decode(response.toString());
    // } catch (e) {
    //   throw Exception("Failed to post data");
    // }
  }

  // PUT Request
  Future<dynamic> put(String endPoint, Map<String, dynamic> data) async {
    if (!(await hasInternetConnection())) {
      throw Exception("No internet connection");
    }
    try {
      Response response = await _dio.put("$baseUrl/$endPoint", data: data);
      _handleError(response);
      return json.decode(response.toString());
    } catch (e) {
      throw Exception("Failed to update data");
    }
  }

  // DELETE Request
  Future<dynamic> delete(String endPoint) async {
    if (!(await hasInternetConnection())) {
      throw Exception("No internet connection");
    }
    try {
      Response response = await _dio.delete("$baseUrl/$endPoint");
      _handleError(response);
      return json.decode(response.toString());
    } catch (e) {
      throw Exception("Failed to delete data");
    }
  }
}
