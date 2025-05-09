import 'package:flutter/material.dart';
import 'package:housewise/admin-components/blue_section_titile.dart';
import 'package:housewise/admin-features/admin-home/presentation/widgets/admin_functions_widget.dart';
import 'package:housewise/admin-components/admin_profile_banner_widget.dart';
import 'package:housewise/admin-features/admin-home/presentation/widgets/notice_board_widget.dart';
import 'package:housewise/config/components/custom_appbar.dart';
import 'package:housewise/config/components/section_title.dart';

class AdminHomeScreen extends StatelessWidget {
  const AdminHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: CustomAppBar(title: "Admin Home"),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            AdminProfileBannerWidget(),
            AdminFunctionsWidget(),
            Divider(height: 20, color: Colors.grey.shade300),
            AdminNoticeBoardWidget()
          ],
        ),
      ),
    );
  }
}
