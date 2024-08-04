import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DatePickerButton extends StatefulWidget {
  const DatePickerButton({super.key});

  @override
  DatePickerButtonState createState() => DatePickerButtonState();
}

class DatePickerButtonState extends State<DatePickerButton> {
  DateTime selectedDate = DateTime(2024, 8, 4); // Initialize to August 2024

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(2024, 1),
      lastDate: DateTime(2024, 12),
      initialEntryMode: DatePickerEntryMode.calendar,
    );
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          "${selectedDate.year}", // Display only the year
          // style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        InkWell(
          onTap: () => _selectDate(context),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                _monthName(selectedDate.month), // Display the month name
                style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
              ),
              const Icon(Icons.arrow_drop_down),
            ],
          ),
        ),
      ],
    );
  }

  String _monthName(int month) {
    const List<String> monthNames = [
      'Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'
    ];
    return monthNames[month - 1];
  }
}
