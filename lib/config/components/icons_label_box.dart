import 'package:flutter/material.dart';
import 'package:housewise/config/color/color.dart';
import 'package:housewise/config/textstyles/text_styles.dart';

class IconLabelBox extends StatelessWidget {
  final String imagePath;
  final String label;
  final double size;

  const IconLabelBox({
    super.key,
    required this.imagePath,
    required this.label,
    this.size = 100,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: size,
      width: size,
      child: Column(
        spacing: 4,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: size / 2.5,
            width: size / 2.5,
            child: Image.asset(imagePath),
          ),
          FittedBox(
            child: Text(
              label,
              style: AppTextStyles.mediumRegular
                  .copyWith(color: AppColor.black.withAlpha(100)),
            ),
          )
        ],
      ),
    );
  }
}
