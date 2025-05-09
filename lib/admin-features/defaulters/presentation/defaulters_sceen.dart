import 'package:flutter/material.dart';
import 'package:housewise/admin-components/admin_profile_banner_widget.dart';
import 'package:housewise/admin-components/notification_card.dart';
import 'package:housewise/admin-features/defaulters/presentation/widgets/defaultters_list_widget.dart';
import 'package:housewise/config/components/custom_appbar.dart';

// Model class for defaulter data

class DefaultersSceen extends StatelessWidget {
  const DefaultersSceen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: CustomAppBar(title: "Defaulters"),
      body: Column(
        children: [
          const AdminProfileBannerWidget(),
          Expanded(child: DefaulttersListWidget()),
        ],
      ),
    );
  }
}
