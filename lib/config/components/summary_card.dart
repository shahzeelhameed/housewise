import 'package:flutter/material.dart';
import 'package:housewise/config/color/color.dart';
import 'package:housewise/config/screen_sizes/screen_sizes.dart';
import 'package:housewise/config/textstyles/text_styles.dart';

class SummaryCard extends StatelessWidget {
  final String title;
  final String label;
  final String description;

  const SummaryCard({
    super.key,
    required this.title,
    required this.label,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 130,
      width: ScreenSize(context).screenWidth * 0.5,
      padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            title,
            style: AppTextStyles.largeBold
                .copyWith(fontSize: 17, color: AppColor.black.withAlpha(100)),
          ),
          Column(
            children: [
              Text(
                label,
                style: AppTextStyles.largeBold.copyWith(
                    fontSize: 17, color: AppColor.black.withAlpha(100)),
              ),
              Text(
                description,
                style: AppTextStyles.largeBold.copyWith(
                    fontSize: 17, color: AppColor.black.withAlpha(100)),
              )
            ],
          )
        ],
      ),
    );
  }
}
