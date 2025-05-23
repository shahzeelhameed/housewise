import 'package:flutter/material.dart';
import 'package:housewise/config/components/custom_appbar.dart';
import 'package:housewise/config/components/section_title.dart';
import 'package:housewise/dosmestic/home/presentation/widgets/request_list_widget.dart';
import 'package:housewise/features/home/presentation/widgets/profile_banner.dart';

class DomesticHomeScreen extends StatelessWidget {
  const DomesticHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: CustomAppBar(
        title: "Domestic Home",
        isDommestic: false,
        onLogout: () {},
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ProfileBanner(name: "Soban Malik", address: "Domestic Person"),
          SectionTitleBox(title: "Requests"),
          Expanded(child: DomesticComplainsList())
        ],
      ),
    );
  }
}
