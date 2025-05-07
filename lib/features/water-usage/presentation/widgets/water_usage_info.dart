import 'package:flutter/material.dart';
import 'package:housewise/config/color/color.dart';
import 'package:housewise/config/components/icons_label_box.dart';
import 'package:housewise/config/components/wave_card.dart';

class WaterUsageInformation extends StatelessWidget {
  const WaterUsageInformation({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        IconLabelBox(
            imagePath: "assets/icons/Water Usage Home.png",
            label: "Water usage"),
        Row(
          spacing: 5,
          children: [
            Expanded(
              child: WaveCard(
                title: "Usage",
                liters: 240.0,
                unit: "L",
                waveContainerColor: AppColor.vividSkyBlue,
                waveColor1: AppColor.deepBlue,
                waveColor2: AppColor.secondary,
                waveColor3: AppColor.primary,
                waveColor4: Colors.lightBlue,
              ),
            ),
            Expanded(
              child: WaveCard(
                title: "Flow",
                liters: 542.0,
                unit: "L/s",
                waveContainerColor: AppColor.goldenOrange,
                waveColor1: AppColor.orangeAcccent,
                waveColor2: AppColor.deepOrange,
                waveColor3: AppColor.orange,
                waveColor4: AppColor.amber,
              ),
            )
          ],
        ),
      ],
    );
  }
}
