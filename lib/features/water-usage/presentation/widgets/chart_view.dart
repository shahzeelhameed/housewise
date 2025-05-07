import 'package:flutter/cupertino.dart';
import 'package:housewise/config/screen_sizes/screen_sizes.dart';
import 'package:housewise/features/water-usage/presentation/widgets/bar_chart.dart';

class ChartView extends StatelessWidget {
  const ChartView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        height: ScreenSize(context).screenHeight * 0.3,
        width: ScreenSize(context).screenWidth * 0.9,
        margin: const EdgeInsets.only(top: 10),
        child: MyBarChart(data: [
          100,
          200,
          300,
          400,
          500,
          600,
          200,
          300,
          200,
          100,
          400,
          600
        ]));
  }
}
