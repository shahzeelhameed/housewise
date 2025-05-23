import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:housewise/config/color/color.dart';
import 'package:housewise/config/screen_sizes/screen_sizes.dart';
import 'package:housewise/config/textstyles/text_styles.dart';

class ProfileBanner extends StatelessWidget {
  const ProfileBanner({super.key, required this.name, required this.address});

  final String name;
  final String address;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
          height: 200,
          width: double.infinity,
          child: Image.asset(
            "assets/icons/WhatsApp Image 2025-04-28 at 8.12.33 PM.jpeg",
            fit: BoxFit.cover,
          ),
        ),
        Positioned.fill(
          child: Opacity(
            opacity: 0.95,
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [AppColor.primary, AppColor.secondary],
                ),
              ),
            ),
          ),
        ),
        Positioned(
          left: ScreenSize(context).screenWidth * 0.30,
          top: ScreenSize(context).screenHeight * 0.13,
          child: Column(
            spacing: 5,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                name,
                style: AppTextStyles.mediumSemiBold
                    .copyWith(color: AppColor.white),
              ),
              Row(
                spacing: 5,
                children: [
                  Text(
                    address,
                    style: AppTextStyles.mediumRegular
                        .copyWith(color: AppColor.white),
                  ),
                  Container(
                    height: 20,
                    width: 20,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle, color: AppColor.primary),
                    child: Icon(
                      Icons.arrow_forward_ios_rounded,
                      size: 18,
                      color: AppColor.white,
                    ),
                  )
                ],
              )
            ],
          ),
        )
      ],
    );
  }
}
