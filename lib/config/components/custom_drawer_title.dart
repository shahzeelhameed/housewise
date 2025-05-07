import 'package:flutter/material.dart';
import 'package:housewise/config/color/color.dart';
import 'package:housewise/config/textstyles/text_styles.dart';

class CustomDrawerTile extends StatelessWidget {
  final IconData icon;
  final String title;
  final VoidCallback onTap;

  const CustomDrawerTile({
    super.key,
    required this.icon,
    required this.title,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(
        icon,
        color: AppColor.white,
        size: 24,
      ),
      title: Text(
        title,
        style: AppTextStyles.mediumRegular.copyWith(color: AppColor.white),
      ),
      onTap: onTap,
      // Adds a subtle highlight effect when tapped
      hoverColor: AppColor.white.withOpacity(0.1),
      // Rounded corners for a modern touch when selected
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
    );
  }
}
