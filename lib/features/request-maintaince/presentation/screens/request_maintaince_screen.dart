import 'package:flutter/material.dart';
import 'package:housewise/config/color/color.dart';
import 'package:housewise/config/components/custom_appbar.dart';
import 'package:housewise/config/components/section_title.dart';
import 'package:housewise/config/screen_sizes/screen_sizes.dart';
import 'package:housewise/config/textstyles/text_styles.dart';
import 'package:housewise/features/home/presentation/widgets/profile_banner.dart';
import 'package:housewise/features/request-maintaince/presentation/widgets/date_picker_input_widget.dart';
import 'package:housewise/features/request-maintaince/presentation/widgets/request_maintaince_inputs.dart';
import 'package:housewise/features/request-maintaince/presentation/widgets/title_input_widget.dart';

class RequestMaintainceScreen extends StatelessWidget {
  const RequestMaintainceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: CustomAppBar(
        title: "Request Maintaince",
      ),
      body: Column(
        children: [
          ProfileBanner(
            name: "Muhammad Umer",
            address: "Flat no : 1",
          ),
          Expanded(child: RequestMaintainceInputs())
        ],
      ),
    );
  }
}
