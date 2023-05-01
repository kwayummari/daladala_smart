import 'package:daladala_smart/src/service/dropdown-service.dart';
import 'package:flutter/material.dart';

class DropdownTextFormField extends StatefulWidget {
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

  @override
  State<DropdownTextFormField> createState() => _DropdownTextFormFieldState();
}

class _DropdownTextFormFieldState extends State<DropdownTextFormField> {

  Future<List<Map<String, dynamic>>> _getItems() async {
    final dropdownService _dropdownService = await dropdownService();
    final data = await _dropdownService.dropdown(context, widget.apiUrl) as List<dynamic>;
      return data.map((item) => item as Map<String, dynamic>).toList();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Map<String, dynamic>>>(
      future: _getItems(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return DropdownButtonFormField<String>(
            decoration: InputDecoration(
              labelText: widget.labelText,
              border: OutlineInputBorder(),
            ),
            items: snapshot.data!
                .map((item) => DropdownMenuItem<String>(
                      value: item[widget.valueField].toString(),
                      child: Text(item[widget.displayField]),
                    ))
                .toList(),
            onChanged: widget.onChanged,
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
