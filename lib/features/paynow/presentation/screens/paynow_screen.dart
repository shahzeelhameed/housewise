import 'package:flutter/material.dart';
import 'package:housewise/config/color/color.dart';
import 'package:housewise/config/components/custom_appbar.dart';
import 'package:housewise/config/components/drawer.dart';
import 'package:housewise/config/components/section_title.dart';
import 'package:housewise/config/screen_sizes/screen_sizes.dart';

import 'package:housewise/features/home/presentation/widgets/profile_banner.dart';
import 'package:housewise/features/paynow/presentation/widgets/amount_due_widget.dart';
import 'package:housewise/features/paynow/presentation/widgets/bill_info_widget.dart';
import 'package:housewise/features/paynow/presentation/widgets/how_to_pay_widget.dart';

class PayNowScreen extends StatelessWidget {
  const PayNowScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.lightGray,
      extendBodyBehindAppBar: true,
      drawer: CustomDrawer(),
      appBar: CustomAppBar(title: "Pay Now"),
      body: SingleChildScrollView(
        child: Column(
          spacing: 10,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ProfileBanner(),
            BillInfoCard(),
            SectionTitleBox(title: "Payment"),
            AmountDue(),
            HowToPay(),
          ],
        ),
      ),
    );
  }
}
