import 'package:flutter/material.dart';
import 'package:housewise/config/color/color.dart';
import 'package:housewise/config/textstyles/text_styles.dart';

class RoundedOvalButton extends StatelessWidget {
  RoundedOvalButton({super.key, required this.onPress, required this.title});

  String title;
  VoidCallback onPress;

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: onPress,
      style: OutlinedButton.styleFrom(
        backgroundColor: AppColor.secondary,
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 9.0),
        shape: const StadiumBorder(),
        side: const BorderSide(color: Colors.blue),
      ),
      child: Text(title,
          style: AppTextStyles.mediumSemiBold.copyWith(color: AppColor.white)),
    );
  }
}
