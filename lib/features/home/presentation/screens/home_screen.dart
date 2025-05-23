import 'package:flutter/material.dart';
import 'package:housewise/config/color/color.dart';
import 'package:housewise/config/components/custom_appbar.dart';
import 'package:housewise/config/components/drawer.dart';
import 'package:housewise/config/components/icons_label_box.dart';
import 'package:housewise/config/components/section_title.dart';
import 'package:housewise/config/screen_sizes/screen_sizes.dart';
import 'package:housewise/config/textstyles/text_styles.dart';
import 'package:housewise/features/home/presentation/widgets/carousel_view_widget.dart';
import 'package:housewise/features/home/presentation/widgets/functions_widget.dart';
import 'package:housewise/features/home/presentation/widgets/notice_board_widget.dart';
import 'package:housewise/features/home/presentation/widgets/payment_info_widget.dart';
import 'package:housewise/features/home/presentation/widgets/profile_banner.dart';
import 'package:housewise/features/home/presentation/widgets/water_info_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: CustomAppBar(title: "Home"),
      drawer: CustomDrawer(),
      body: SingleChildScrollView(
        child: Column(
          spacing: 7,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ProfileBanner(
              name: "Muhammad Umer",
              address: "Flat no : 1",
            ),
            WaterInfo(),
            PaymentInfo(),
            CarouselViewImages(),
            SectionTitleBox(title: "Functions"),
            Functions(),
            SectionTitleBox(title: "Notice Board"),
            NoticeBoard(),
            SizedBox(
              height: 20,
            )
          ],
        ),
      ),
    );
  }
}
