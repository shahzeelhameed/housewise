import 'package:flutter/material.dart';
import 'package:housewise/config/components/form_header_widget.dart';
import 'package:housewise/constants/image_strings.dart';
import 'package:housewise/constants/sizes.dart';
import 'package:housewise/constants/text_strings.dart';
import 'package:housewise/features/auth/signup/widgets/signup_footer_widget.dart';
import 'package:housewise/features/auth/signup/widgets/signup_form_widget.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(vDefaultSize),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const FormHeaderWidget(
                  image: vWelcomeScreenImage,
                  title: vSignUpTitle,
                  subTitle: vSignUpSubTitle,
                  imageHeight: 0.20,
                ),
                SignUpFormWidget(),
                const SignUpFooterWidget(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
