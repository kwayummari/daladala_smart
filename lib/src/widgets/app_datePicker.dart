import 'package:flutter/material.dart';

class CustomizableDatePicker extends StatefulWidget {
  final String title;
  final Function(DateTime) onDateSelected;
  final Color textColor;
  final Color buttonColor;
  final Color selectedColor;
  final Color todayColor;
  final Color backgroundColor;

  CustomizableDatePicker({
    required this.title,
    required this.onDateSelected,
    this.textColor = Colors.white,
    this.buttonColor = Colors.blue,
    this.selectedColor = Colors.red,
    this.todayColor = Colors.green,
    this.backgroundColor = Colors.grey,
  });

  @override
  _CustomizableDatePickerState createState() => _CustomizableDatePickerState();
}

class _CustomizableDatePickerState extends State<CustomizableDatePicker> {
  late DateTime _selectedDate;

  @override
  void initState() {
    super.initState();
    _selectedDate = DateTime.now();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.title,
          style: TextStyle(
            color: widget.textColor,
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
        SizedBox(height: 10),
        Container(
          decoration: BoxDecoration(
            color: widget.backgroundColor,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                onPressed: () {
                  setState(() {
                    _selectedDate = _selectedDate.subtract(Duration(days: 1));
                  });
                },
                icon: Icon(Icons.arrow_back),
                color: widget.buttonColor,
              ),
              Text(
                '${_selectedDate.day}/${_selectedDate.month}/${_selectedDate.year}',
                style: TextStyle(
                  color: widget.textColor,
                  fontSize: 16,
                ),
              ),
              IconButton(
                onPressed: () {
                  setState(() {
                    _selectedDate = _selectedDate.add(Duration(days: 1));
                  });
                },
                icon: Icon(Icons.arrow_forward),
                color: widget.buttonColor,
              ),
            ],
          ),
        ),
        SizedBox(height: 10),
        GridView.builder(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          itemCount: 31,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 7,
            childAspectRatio: 1.2,
          ),
          itemBuilder: (BuildContext context, int index) {
            DateTime date = DateTime(_selectedDate.year, _selectedDate.month, index + 1);
            bool isToday = date.day == DateTime.now().day &&
                date.month == DateTime.now().month &&
                date.year == DateTime.now().year;
            bool isSelected = date.day == _selectedDate.day &&
                date.month == _selectedDate.month &&
                date.year == _selectedDate.year;

            return GestureDetector(
              onTap: () {
                setState(() {
                  _selectedDate = date;
                });
                widget.onDateSelected(date);
              },
              child: Container(
                margin: EdgeInsets.all(2),
                decoration: BoxDecoration(
                  color: isToday
                      ? widget.todayColor
                      : isSelected
                      ? widget.selectedColor
                      : Colors.transparent,
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Center(
                  child: Text(
                    '${index + 1}',
                    style: TextStyle(
                      color: isSelected ? Colors.white : widget.textColor,
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ],
    );
  }
}
