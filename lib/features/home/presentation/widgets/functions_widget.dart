import 'package:flutter/material.dart';
import 'package:housewise/config/components/icons_label_box.dart';
import 'package:housewise/config/routes/routes_name.dart';

class Functions extends StatelessWidget {
  const Functions({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 40,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        InkWell(
          onTap: () {
            Navigator.of(context, rootNavigator: true)
                .pushNamed(RoutesName.WATER_USAGE);
          },
          child: IconLabelBox(
              imagePath: "assets/icons/Water Usage Home.png",
              label: "Water usage"),
        ),
        InkWell(
          onTap: () {
            Navigator.of(context, rootNavigator: true)
                .pushNamed(RoutesName.REQUEST_MAINTENANCE);
          },
          child: IconLabelBox(
              imagePath: "assets/icons/Request Maintenance.png",
              label: "Request Maintenance"),
        ),
      ],
    );
  }
}
