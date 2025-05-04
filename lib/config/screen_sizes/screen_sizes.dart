import 'package:flutter/cupertino.dart';

class ScreenSize {
  ScreenSize(this.context);

  final BuildContext context;

  double get screenHeight => MediaQuery.of(context).size.height;
  double get screenWidth => MediaQuery.of(context).size.width;
}
