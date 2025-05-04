import 'package:flutter/material.dart';
import 'package:housewise/config/color/color.dart';
import 'package:housewise/config/components/custom_appbar.dart';
import 'package:housewise/config/components/drawer.dart';
import 'package:housewise/config/components/section_title.dart';
import 'package:housewise/config/screen_sizes/screen_sizes.dart';
import 'package:housewise/config/textstyles/text_styles.dart';
import 'package:housewise/features/bills/presentation/widgets/billing_and_payment_history_widget.dart';
import 'package:housewise/features/home/presentation/widgets/profile_banner.dart';
import 'package:housewise/features/paynow/presentation/widgets/amount_due_widget.dart';
import 'package:housewise/features/paynow/presentation/widgets/bill_info_widget.dart';

class BillsScreen extends StatelessWidget {
  const BillsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.lightGray,
      extendBodyBehindAppBar: true,
      appBar: CustomAppBar(title: "Bills"),
      drawer: CustomDrawer(),
      body: SingleChildScrollView(
        child: Column(
          spacing: 10,
          children: [
            ProfileBanner(),
            AmountDue(),
            BillingAndPaymentHistory(),
          ],
        ),
      ),
    );
  }
}
