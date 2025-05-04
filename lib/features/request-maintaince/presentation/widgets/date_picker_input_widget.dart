import 'package:flutter/material.dart';
import 'package:housewise/services/dateTime_picker_service.dart';
import 'package:intl/intl.dart';

class DatePickerInputWidget extends StatefulWidget {
  const DatePickerInputWidget({super.key});

  @override
  State<DatePickerInputWidget> createState() => _DatePickerInputWidgetState();
}

class _DatePickerInputWidgetState extends State<DatePickerInputWidget> {
  TextEditingController dateController = TextEditingController();

  @override
  void dispose() {
    super.dispose();

    dateController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: dateController,
      style: TextStyle(color: Colors.white),
      decoration: InputDecoration(
        labelText: "DATE",
        labelStyle: TextStyle(color: Colors.white),
        suffixIcon: Icon(Icons.calendar_today, color: Colors.white),
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.white),
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.white),
        ),
      ),
      readOnly: true,
      onTap: () async {
        final date = await DateTimePickerService().pickDate(context);

        setState(() {
          dateController.text = date;
        });
      },
    );
  }
}
