import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:housewise/config/color/color.dart';
import 'package:housewise/config/textstyles/text_styles.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final bool showBackButton;
  final bool isDommestic;
  final VoidCallback? onLogout;
  final bool applyLeading;

  const CustomAppBar(
      {super.key,
      required this.title,
      this.showBackButton = false,
      this.isDommestic = false,
      this.onLogout,
      this.applyLeading = true});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: applyLeading,
      iconTheme: IconThemeData(color: AppColor.white),
      actions: [
        if (isDommestic) ...[
          IconButton(onPressed: onLogout, icon: Icon(Icons.logout))
        ]
      ],
      title: Text(
        title,
        style: AppTextStyles.mediumSemiBold.copyWith(color: AppColor.white),
      ),
      backgroundColor: Colors.transparent,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
