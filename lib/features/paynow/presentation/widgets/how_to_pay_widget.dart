import 'package:flutter/material.dart';
import 'package:housewise/config/color/color.dart';
import 'package:housewise/config/screen_sizes/screen_sizes.dart';
import 'package:housewise/config/textstyles/text_styles.dart';

class HowToPay extends StatelessWidget {
  HowToPay({
    super.key,
  });

  List<String> points = [
    " Open the app and go to the 'Pay Now' section.",
    " Enter your Bill Top Up ID and amount.",
    " Choose your preferred payment method.",
    " Confirm the payment details and proceed.",
    " Receive a confirmation of your payment."
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      width: ScreenSize(context).screenWidth,
      padding: const EdgeInsets.all(10),
      color: AppColor.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            margin: EdgeInsets.symmetric(horizontal: 20),
            child: Text("How to Pay ? ",
                style: AppTextStyles.largeBold
                    .copyWith(color: AppColor.secondary)),
          ),
          ListView.builder(
            padding: const EdgeInsets.only(top: 3),
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: points.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.all(3),
                child: ListTile(
                  titleAlignment: ListTileTitleAlignment.center,
                  minVerticalPadding: 2,
                  leading: Icon(Icons.check_circle, color: AppColor.secondary),
                  title: Text(
                    points[index],
                    style: AppTextStyles.mediumRegular,
                  ),
                ),
              );
            },
          )
        ],
      ),
    );
  }
}
