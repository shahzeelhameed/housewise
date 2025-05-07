import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:housewise/config/color/color.dart';

import 'package:housewise/config/components/custom_drawer_title.dart';
import 'package:housewise/config/textstyles/text_styles.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        color: AppColor.primary, // Use primary color as background
        child: Column(
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [AppColor.primary, AppColor.secondary],
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  // Circle avatar for user picture
                  CircleAvatar(
                    backgroundColor: AppColor.white,
                    radius: 32,
                    child: Icon(
                      Icons.person,
                      size: 36,
                      color: AppColor.primary,
                    ),
                  ),
                  SizedBox(height: 12),
                  // Username text
                  Text(
                    'Hello, User!',
                    style:
                        AppTextStyles.largeBold.copyWith(color: AppColor.white),
                  ),
                ],
              ),
            ),
            // Drawer items
            CustomDrawerTile(
              icon: Icons.home_outlined,
              title: 'Home',
              onTap: () {
                Navigator.pop(context);
                // Handle navigation
              },
            ),
            CustomDrawerTile(
              icon: Icons.settings_outlined,
              title: 'Settings',
              onTap: () {
                Navigator.pop(context);
                // Handle navigation
              },
            ),
            Expanded(child: Container()), // Push logout to bottom
            Divider(color: AppColor.white.withOpacity(0.3), height: 1),
            CustomDrawerTile(
              icon: Icons.logout_outlined,
              title: 'Logout',
              onTap: () {
                Navigator.pop(context);
                // Handle logout
              },
            ),
            SizedBox(height: 16), // Add some bottom padding
          ],
        ),
      ),
    );
  }
}
