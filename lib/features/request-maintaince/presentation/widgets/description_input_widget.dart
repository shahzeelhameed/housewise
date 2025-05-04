import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:housewise/config/color/color.dart';

class DescriptionInputWidget extends StatelessWidget {
  const DescriptionInputWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      maxLines: 5,
      minLines: 1,
      inputFormatters: [LengthLimitingTextInputFormatter(170)],
      cursorColor: AppColor.secondary,
      style: TextStyle(color: AppColor.softGreyBlue),
      decoration: InputDecoration(
        labelText: 'Description',
        labelStyle: const TextStyle(color: AppColor.secondary),
        hintStyle: const TextStyle(color: AppColor.softGreyBlue),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: AppColor.softGreyBlue),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: AppColor.secondary),
        ),
      ),
    );
  }
}
