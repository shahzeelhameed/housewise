import 'package:flutter/material.dart';
import 'package:housewise/admin-components/admin_profile_banner_widget.dart';
import 'package:housewise/admin-features/manage-complaints/presentation/widgets/req_grid_widget.dart';
import 'package:housewise/config/components/custom_appbar.dart';

class ManageComplaintsScreen extends StatelessWidget {
  const ManageComplaintsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: CustomAppBar(title: "Manage Complaints"),
      body: Column(
        children: [
          AdminProfileBannerWidget(),
          Expanded(child: ComplainsList())
        ],
      ),
    );
  }
}
