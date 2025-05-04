import 'package:flutter/material.dart';
import 'package:housewise/config/color/color.dart';
import 'package:housewise/config/textstyles/text_styles.dart';

class SectionTitleBox extends StatelessWidget {
  final String title;
  final double width;
  final Color? color;
  const SectionTitleBox(
      {super.key,
      required this.title,
      this.width = 100,
      this.color = AppColor.black});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10),
      width: width,
      child: Column(
        children: [
          FittedBox(
            child: Text(
              title,
              style: AppTextStyles.mediumRegular
                  .copyWith(fontSize: 20, color: color),
            ),
          ),
          Divider(
            color: color,
            thickness: 2,
          )
        ],
      ),
    );
  }
}
