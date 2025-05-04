import 'package:flutter/material.dart';
import 'package:housewise/config/color/color.dart';
import 'package:housewise/config/textstyles/text_styles.dart';

class StatusInfoCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final Color backgroundColor;

  const StatusInfoCard({
    super.key,
    required this.title,
    required this.subtitle,
    required this.backgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 130,
      width: 200,
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Text(
            title,
            style: AppTextStyles.extraLargeBold.copyWith(
              fontSize: 40,
              color: AppColor.white,
            ),
          ),
          Text(
            subtitle,
            style: AppTextStyles.mediumRegular.copyWith(
              fontSize: 20,
              color: AppColor.white,
            ),
          ),
        ],
      ),
    );
  }
}
