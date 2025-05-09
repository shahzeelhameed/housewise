import 'package:flutter/material.dart';

class TitleInputWidget extends StatelessWidget {
  const TitleInputWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        hintText: 'Write Title',
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
          borderSide: BorderSide(color: Colors.grey.shade400),
        ),
        contentPadding: const EdgeInsets.all(16.0),
      ),
    );
  }
}
