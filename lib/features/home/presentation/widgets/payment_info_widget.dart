import 'package:flutter/material.dart';
import 'package:housewise/config/color/color.dart';
import 'package:housewise/config/components/status_info_card.dart';

class PaymentInfo extends StatelessWidget {
  const PaymentInfo({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5),
      child: Row(
        spacing: 10,
        children: [
          Expanded(
            child: StatusInfoCard(
                title: "Paid",
                subtitle: "Bill",
                backgroundColor: AppColor.freshGreen),
          ),
          Expanded(
            child: StatusInfoCard(
                title: "1210",
                subtitle: "Amount",
                backgroundColor: AppColor.vividRed),
          )
        ],
      ),
    );
  }
}
