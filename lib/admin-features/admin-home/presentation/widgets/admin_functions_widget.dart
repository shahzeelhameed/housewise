import 'package:flutter/material.dart';
import 'package:housewise/config/components/icons_label_box.dart';
import 'package:housewise/config/components/section_title.dart';
import 'package:housewise/config/routes/routes_name.dart';

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
              InkWell(
                onTap: () => Navigator.of(context, rootNavigator: true)
                    .pushNamed(RoutesName.ADMIN_WATER_USAGE),
                child: IconLabelBox(
                    imagePath: "assets/images/Water Comparison Admin.png",
                    label: "Real Time Water\nMonitoring"),
              ),
              InkWell(
                onTap: () => Navigator.of(context, rootNavigator: true)
                    .pushNamed(RoutesName.ADMIN_USER_REQUEST),
                child: IconLabelBox(
                    imagePath: "assets/images/User Requests.png",
                    label: "User Requests"),
              ),
              InkWell(
                onTap: () => Navigator.of(context, rootNavigator: true)
                    .pushNamed(RoutesName.ADMIN_CREATE_USER),
                child: IconLabelBox(
                    imagePath: "assets/images/Add new Admin _ Request.png",
                    label: "Add new Admin\n/ Request"),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
