import 'package:flutter/material.dart';
import 'package:housewise/config/color/color.dart';
import 'package:housewise/config/components/rounded_blue_button.dart';
import 'package:housewise/config/components/rouned_oval_button.dart';
import 'package:housewise/config/components/section_title.dart';
import 'package:housewise/config/screen_sizes/screen_sizes.dart';
import 'package:housewise/config/textstyles/text_styles.dart';
import 'package:housewise/features/request-maintaince/presentation/widgets/date_picker_input_widget.dart';
import 'package:housewise/features/request-maintaince/presentation/widgets/description_input_widget.dart';
import 'package:housewise/features/request-maintaince/presentation/widgets/time_input_widget.dart';
import 'package:housewise/features/request-maintaince/presentation/widgets/title_input_widget.dart';

class RequestMaintainceInputs extends StatelessWidget {
  const RequestMaintainceInputs({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.loose,
      children: [
        SizedBox(
          height: 200,
          width: double.infinity,
          child: Image.asset(
            "assets/icons/WhatsApp Image 2025-04-28 at 8.12.33 PM.jpeg",
            fit: BoxFit.cover,
          ),
        ),
        Positioned(
          child: Opacity(
            opacity: 0.99,
            child: Container(
              height: ScreenSize(context).screenHeight * 0.25,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [AppColor.primary, AppColor.deepBlue],
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  spacing: 10,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SectionTitleBox(
                      title: "Request Maintaince",
                      color: AppColor.white,
                      width: 200,
                    ),
                    TitleInputWidget(),
                    DatePickerInputWidget()
                  ],
                ),
              ),
            ),
          ),
        ),
        Positioned(
          top: ScreenSize(context).screenHeight * 0.24,
          left: ScreenSize(context).screenWidth * 0.01,
          right: ScreenSize(context).screenWidth * 0.01,
          bottom: ScreenSize(context).screenHeight * 0.03,
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: AppColor.white,
            ),
            height: ScreenSize(context).screenHeight * 0.6,
            width: ScreenSize(context).screenWidth,
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TimeInputWidget(),
                  DescriptionInputWidget(),
                  Text(
                    "Upload Area That needs maintaince",
                    style: AppTextStyles.mediumRegular
                        .copyWith(color: AppColor.softGreyBlue),
                  ),
                  RoundedOvalButton(
                    onPress: () {},
                    title: "Upload",
                    prefixIcon: Icon(Icons.arrow_circle_up_sharp,
                        color: AppColor.white, size: 20),
                  ),
                  RoundedBlueButton(
                    text: "Create Task",
                    onPressed: () {},
                    height: 50,
                    width: double.infinity,
                  )
                ],
              ),
            ),
          ),
        )
      ],
    );
  }
}
