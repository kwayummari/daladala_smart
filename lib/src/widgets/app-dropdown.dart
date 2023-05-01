import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class DropdownTextFormField extends StatelessWidget {
  final String labelText;
  final String apiUrl;
  final String valueField;
  final String displayField;
  final void Function(String?)? onChanged;

  DropdownTextFormField({
    required this.labelText,
    required this.apiUrl,
    required this.valueField,
    required this.displayField,
    this.onChanged,
  });

  Future<List<Map<String, dynamic>>> _getItems() async {
    final response = await http.get(Uri.parse(apiUrl));
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body) as List<dynamic>;
      return data.map((item) => item as Map<String, dynamic>).toList();
    } else {
      throw Exception('Failed to fetch items');
    }
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Map<String, dynamic>>>(
      future: _getItems(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return DropdownButtonFormField<String>(
            decoration: InputDecoration(
              labelText: labelText,
              border: OutlineInputBorder(),
            ),
            items: snapshot.data!
                .map((item) => DropdownMenuItem<String>(
                      value: item[valueField].toString(),
                      child: Text(item[displayField]),
                    ))
                .toList(),
            onChanged: onChanged,
          );
        } else if (snapshot.hasError) {
          return Text('Failed to fetch items');
        } else {
          return const CircularProgressIndicator();
        }
      },
    );
  }
}
