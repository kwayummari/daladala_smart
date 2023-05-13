import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class CustomizableDatePicker extends StatefulWidget {
  final String title;
  final Function(DateTime) onDateSelected;
  final Color backgroundColor;
  final Color buttonColor;
  final Color selectedColor;
  final Color todayColor;
  final Color textColor;

  const CustomizableDatePicker({
    Key? key,
    required this.title,
    required this.onDateSelected,
    this.backgroundColor = Colors.white,
    this.buttonColor = Colors.blue,
    this.selectedColor = Colors.blue,
    this.todayColor = Colors.grey,
    this.textColor = Colors.black,
  }) : super(key: key);

  @override
  _CustomizableDatePickerState createState() => _CustomizableDatePickerState();
}

class _CustomizableDatePickerState extends State<CustomizableDatePicker> {
  late DateTime _selectedDate;
  late DateFormat _dateFormat;

  @override
  void initState() {
    super.initState();
    _selectedDate = DateTime.now();
    _dateFormat = DateFormat('EEEE, MMMM d, y');
  }

  void _selectDate(BuildContext context) async {
    final now = DateTime.now();
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _selectedDate,
      firstDate: DateTime.now(),
      lastDate: DateTime(now.year, 12, 31),
    );
    if (picked != null && picked != _selectedDate) {
      setState(() {
        _selectedDate = picked;
        widget.onDateSelected(picked);
      });
    }
  }



  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        GestureDetector(
          onTap: () {
            _selectDate(context);
          },
          child: Container(
            padding: EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: widget.backgroundColor,
              border: Border.all(
                color: widget.buttonColor,
                width: 2.0,
              ),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  _dateFormat.format(_selectedDate),
                  style: TextStyle(
                    color: widget.textColor,
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Icon(
                  Icons.calendar_today,
                  color: widget.buttonColor,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
