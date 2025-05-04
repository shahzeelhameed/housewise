import 'package:flutter/material.dart';
import 'package:housewise/config/color/color.dart';
import 'package:housewise/config/components/billing_summary_component.dart';
import 'package:housewise/config/screen_sizes/screen_sizes.dart';
import 'package:housewise/config/textstyles/text_styles.dart';

class BillingAndPaymentHistory extends StatelessWidget {
  const BillingAndPaymentHistory({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 50,
          width: ScreenSize(context).screenWidth * 0.9,
          color: AppColor.white,
          child: Center(
            child: Text(
              "BILLING AND PAYMENT HISTORY",
              style: AppTextStyles.largeBold.copyWith(
                fontSize: 18,
                color: AppColor.black.withAlpha(150),
              ),
            ),
          ),
        ),
        ListView.builder(
            padding: const EdgeInsets.symmetric(vertical: 10),
            itemBuilder: (context, index) {
              return BillingSummary(
                billingMonth: billingData[index]['billingMonth']!,
                billedAmount: billingData[index]['billedAmount']!,
                payDate: billingData[index]['payDate']!,
                paymentAmount: billingData[index]['paymentAmount']!,
                backgroundColor:
                    index.isOdd ? AppColor.veryLightAzure : AppColor.white,
              );
            },
            itemCount: billingData.length,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics()),
      ],
    );
  }
}

// this data is dummy for testing purpose , the actual data will be fetched from the API

// Network => Repository => statemanagement => UI

final List<Map<String, String>> billingData = [
  {
    'billingMonth': 'Jan/2025',
    'billedAmount': '6,500.00',
    'payDate': '28-Jan-2025',
    'paymentAmount': '6,500.00',
  },
  {
    'billingMonth': 'Feb/2025',
    'billedAmount': '7,000.00',
    'payDate': '28-Feb-2025',
    'paymentAmount': '7,000.00',
  },
  {
    'billingMonth': 'Mar/2025',
    'billedAmount': '7,128.73',
    'payDate': '28-Mar-2025',
    'paymentAmount': '7,129.00',
  },
  {
    'billingMonth': 'Apr/2025',
    'billedAmount': '6,980.45',
    'payDate': '28-Apr-2025',
    'paymentAmount': '6,980.00',
  },
  {
    'billingMonth': 'May/2025',
    'billedAmount': '7,250.00',
    'payDate': '28-May-2025',
    'paymentAmount': '7,250.00',
  },
];
