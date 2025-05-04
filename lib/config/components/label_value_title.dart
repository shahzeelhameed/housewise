import 'package:flutter/material.dart';
import 'package:housewise/config/color/color.dart';
import 'package:housewise/config/textstyles/text_styles.dart';

class LabelValueTile extends StatelessWidget {
  final String label;
  final String value;

  const LabelValueTile({
    super.key,
    required this.label,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        label,
        style: AppTextStyles.smallRegular
            .copyWith(color: AppColor.black.withAlpha(100), fontSize: 16),
      ),
      subtitle: Text(
        value,
        style: AppTextStyles.mediumSemiBold,
      ),
    );
  }
}
