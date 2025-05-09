import 'package:flutter/material.dart';

class AdminWaterUsageScreen extends StatelessWidget {
  const AdminWaterUsageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      appBar: AppBar(
        title: Text("Water Usage"),
      ),
    );
  }
}
