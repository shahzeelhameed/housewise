import 'package:flutter/material.dart';
import 'package:housewise/config/color/color.dart';

class TitleInputWidget extends StatelessWidget {
  const TitleInputWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      cursorColor: AppColor.white,
      style: TextStyle(color: AppColor.white),
      decoration: InputDecoration(
        hintText: 'Title',
        hintStyle: TextStyle(color: AppColor.white),
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: AppColor.white),
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: AppColor.white),
        ),
      ),
    );
  }
}
