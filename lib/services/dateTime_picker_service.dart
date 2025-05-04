import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DateTimePickerService {
  static final DateTimePickerService _instance =
      DateTimePickerService._internal();

  DateTimePickerService._internal();

  factory DateTimePickerService() {
    return _instance;
  }

  // Method to pick a date
  Future<String> pickDate(BuildContext context) async {
    DateTime? selectedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );

    if (selectedDate != null) {
      String formattedDate = DateFormat('yyyy-MM-dd').format(selectedDate);
      return formattedDate;
    } else {
      return '';
    }
  }

  Future<String> pickTime(BuildContext context) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );

    if (picked != null) {
      final now = DateTime.now();
      final selectedTime =
          DateTime(now.year, now.month, now.day, picked.hour, picked.minute);
      String formattedTime = DateFormat('hh:mm a').format(selectedTime);

      return formattedTime;
    }
    return '';
  }
}
