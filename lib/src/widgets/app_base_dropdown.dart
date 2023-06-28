import 'package:flutter/material.dart';

class DropdownWidget extends StatefulWidget {
  final String title;
  final List<String> items;

  const DropdownWidget({
    Key? key,
    required this.title,
    required this.items,
  }) : super(key: key);

  @override
  _DropdownWidgetState createState() => _DropdownWidgetState();
}

class _DropdownWidgetState extends State<DropdownWidget> {
  bool _isDropdownOpen = false;
  String? _selectedItem;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: () {
            setState(() {
              _isDropdownOpen = !_isDropdownOpen;
            });
          },
          child: Container(
            padding: EdgeInsets.all(16),
            color: Colors.grey[200],
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  widget.title,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Icon(
                  _isDropdownOpen ? Icons.arrow_drop_up : Icons.arrow_drop_down,
                  size: 30,
                ),
              ],
            ),
          ),
        ),
        if (_isDropdownOpen)
          Container(
            padding: EdgeInsets.symmetric(horizontal: 16),
            color: Colors.grey[300],
            child: Column(
              children: [
                for (String item in widget.items)
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        _selectedItem = item;
                        _isDropdownOpen = false;
                      });
                    },
                    child: Container(
                      padding: EdgeInsets.symmetric(vertical: 8),
                      child: Text(item),
                    ),
                  ),
              ],
            ),
          ),
        if (_selectedItem != null)
          Container(
            padding: EdgeInsets.all(16),
            color: Colors.grey[400],
            child: Text(
              'Selected Item: $_selectedItem',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
      ],
    );
  }
}
