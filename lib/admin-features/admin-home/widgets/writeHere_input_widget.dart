import 'package:flutter/material.dart';

class WriteHereInputWidget extends StatelessWidget {
  const WriteHereInputWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      maxLines: 6,
      decoration: InputDecoration(
        hintText: 'Write Here...',
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
          borderSide: BorderSide(color: Colors.grey.shade400),
        ),
        contentPadding: const EdgeInsets.all(16.0),
      ),
    );
  }
}
