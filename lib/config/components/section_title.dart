import 'package:flutter/material.dart';
import 'package:housewise/config/color/color.dart';
import 'package:housewise/config/textstyles/text_styles.dart';

class SectionTitleBox extends StatelessWidget {
  final String title;
  const SectionTitleBox({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10),
      width: 100,
      child: Column(
        children: [
          FittedBox(
            child: Text(
              title,
              style: AppTextStyles.mediumRegular
                  .copyWith(fontSize: 20, color: AppColor.black.withAlpha(150)),
            ),
          ),
          const Divider(
            color: AppColor.black,
            thickness: 2,
          )
        ],
      ),
    );
  }
}
