import 'package:flutter/material.dart';

class Utils {
  static Future<String?> showCommentDialog(
      {required BuildContext context, required Widget widget}) async {
    return showDialog<String?>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return widget;
      },
    );
  }
}
