import 'package:flutter/material.dart';
import 'package:housewise/config/color/color.dart';

import 'package:housewise/config/components/label_value_title.dart';

import 'package:housewise/config/components/rouned_oval_button.dart';
import 'package:housewise/config/screen_sizes/screen_sizes.dart';

class BillInfoCard extends StatelessWidget {
  const BillInfoCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: AppColor.white,
      elevation: 2,
      child: SizedBox(
        height: 200,
        width: ScreenSize(context).screenWidth,
        child: Row(
          children: [
            Expanded(
              child: Column(
                children: [
                  Expanded(
                    child: LabelValueTile(
                      label: "1 Bill Top Up ID",
                      value: "4200003453322",
                    ),
                  ),
                  Expanded(
                    child: LabelValueTile(
                      label: "Issue Date",
                      value: "15-April-2025",
                    ),
                  ),
                  Expanded(
                    child: LabelValueTile(
                      label: "Bill Month",
                      value: "April 2025",
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Column(
                children: [
                  RoundedOvalButton(
                    onPress: () {},
                    title: "Pay now",
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
