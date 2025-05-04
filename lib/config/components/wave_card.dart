import 'package:flutter/material.dart';
import 'package:housewise/config/color/color.dart';
import 'package:housewise/config/textstyles/text_styles.dart';
import 'package:wave/wave.dart';
import 'package:wave/config.dart';

class WaveCard extends StatelessWidget {
  const WaveCard(
      {super.key,
      required this.title,
      required this.liters,
      required this.unit,
      required this.waveContainerColor,
      required this.waveColor1,
      required this.waveColor2,
      required this.waveColor3,
      required this.waveColor4});

  final String title;

  final double liters;

  final String unit;

  final Color waveContainerColor;

  final Color waveColor1;

  final Color waveColor2;

  final Color waveColor3;

  final Color waveColor4;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: Stack(
          alignment: Alignment.center,
          children: [
            WaveWidget(
              config: CustomConfig(
                gradients: [
                  [waveColor1, waveColor2],
                  [waveColor3, waveColor4],
                ],
                durations: [3200, 2100],
                heightPercentages: [0.10, 0.10],
                blur: const MaskFilter.blur(BlurStyle.solid, 4),
              ),
              waveAmplitude: 0,
              backgroundColor: Colors.transparent,
              size: const Size(double.infinity, double.infinity),
            ),
            Text(
              '$title: $liters $unit ',
              style: const TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
