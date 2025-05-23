import 'package:flutter/material.dart';
import 'package:housewise/config/color/color.dart';

import 'package:housewise/config/components/custom_appbar.dart';
import 'package:housewise/config/screen_sizes/screen_sizes.dart';
import 'package:housewise/config/textstyles/text_styles.dart';

import 'package:housewise/features/home/presentation/widgets/profile_banner.dart';
import 'package:housewise/features/water-usage/presentation/widgets/bar_chart.dart';
import 'package:housewise/features/water-usage/presentation/widgets/chart_view.dart';
import 'package:housewise/features/water-usage/presentation/widgets/water_usage_info.dart';

class WaterUsageScreen extends StatelessWidget {
  const WaterUsageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: CustomAppBar(
        title: "Water Usage",
      ),
      body: Column(
        spacing: 20,
        children: [
          ProfileBanner(
            name: "Muhammad Umer",
            address: "Flat no : 1",
          ),
          WaterUsageInformation(),
          Text(
            "Yearly Usage History",
            style: AppTextStyles.largeBold.copyWith(
              fontSize: 18,
              color: AppColor.black.withAlpha(150),
            ),
          ),
          ChartView()
        ],
      ),
    );
  }
}
