import 'package:flutter/material.dart';
import 'package:housewise/config/color/color.dart';

class BlueSectionTitile extends StatelessWidget {
  const BlueSectionTitile({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(bottom: 8.0),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: AppColor.secondary,
            width: 3.0,
          ),
        ),
      ),
      child: Text(
        title,
        style: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: Colors.blue,
        ),
      ),
    );
  }
}
