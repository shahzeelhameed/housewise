import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:housewise/config/color/color.dart';
import 'package:housewise/config/textstyles/text_styles.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          DrawerHeader(
            decoration: BoxDecoration(color: Colors.blue),
            child: Align(
              alignment: Alignment.bottomLeft,
              child: Text(
                'Hello, User!',
                style: AppTextStyles.largeBold.copyWith(color: AppColor.black),
              ),
            ),
          ),
          ListTile(
            leading: Icon(Icons.home),
            title: Text('Home',
                style: AppTextStyles.mediumRegular
                    .copyWith(color: AppColor.white)),
            onTap: () {
              Navigator.pop(context); // Close the drawer
              // Handle navigation
            },
          ),
          ListTile(
            leading: Icon(Icons.settings),
            title: Text('Settings',
                style: AppTextStyles.mediumRegular
                    .copyWith(color: AppColor.white)),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: Icon(Icons.logout),
            title: Text('Logout',
                style: AppTextStyles.mediumRegular
                    .copyWith(color: AppColor.white)),
            onTap: () {
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }
}
