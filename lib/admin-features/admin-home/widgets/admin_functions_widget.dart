import 'package:flutter/material.dart';
import 'package:housewise/config/components/icons_label_box.dart';
import 'package:housewise/config/components/section_title.dart';

class AdminFunctionsWidget extends StatelessWidget {
  const AdminFunctionsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SectionTitleBox(title: 'Functions'),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              IconLabelBox(
                  imagePath: "assets/icons/Request Maintenance.png",
                  label: "Real Time Water\nMonitoring"),
              IconLabelBox(
                  imagePath: "assets/icons/Pay Now.png",
                  label: "User Requests"),
              IconLabelBox(
                  imagePath: "assets/icons/Water Usage Home.png",
                  label: "Add new Admin\n/ Request"),
            ],
          ),
        ],
      ),
    );
  }
}
