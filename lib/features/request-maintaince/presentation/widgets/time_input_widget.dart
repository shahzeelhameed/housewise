import 'package:flutter/material.dart';
import 'package:housewise/services/dateTime_picker_service.dart';

class TimeInputWidget extends StatefulWidget {
  const TimeInputWidget({super.key});

  @override
  _TimeInputWidgetState createState() => _TimeInputWidgetState();
}

class _TimeInputWidgetState extends State<TimeInputWidget> {
  TextEditingController timeController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 200,
      child: TextFormField(
        controller: timeController,
        readOnly: true,
        style: TextStyle(color: Colors.grey),
        decoration: InputDecoration(
          hintText: "Select Time",
          hintStyle: TextStyle(color: Colors.grey),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey),
          ),
          suffixIcon: Icon(Icons.access_time, color: Colors.grey),
        ),
        onTap: () async {
          final time = await DateTimePickerService().pickTime(context);

          setState(() {
            timeController.text = time;
          });
        },
      ),
    );
  }
}
