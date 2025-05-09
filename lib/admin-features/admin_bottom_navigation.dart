import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:housewise/admin-features/admin-home/presentation/admin_home_screendart.dart';
import 'package:housewise/admin-features/admin-water-usage/presentation/admin-water-usage_screen.dart';
import 'package:housewise/admin-features/defaulters/presentation/defaulters_sceen.dart';
import 'package:housewise/admin-features/manage-complaints/presentation/manage-complaints_screen.dart';
import 'package:housewise/admin-features/payment-status/presentation/payment-status_screen.dart';
import 'package:housewise/config/color/color.dart';
import 'package:housewise/features/complaint/presentation/screens/complaint_screen.dart';
import 'package:housewise/features/contact-team/presentation/screens/contact-team_screen.dart';
import 'package:housewise/features/home/presentation/screens/home_screen.dart';
import 'package:housewise/features/bills/presentation/screens/bills_screen.dart';
import 'package:housewise/features/paynow/presentation/screens/paynow_screen.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';

class AdminBottomNavigation extends StatefulWidget {
  const AdminBottomNavigation({super.key});

  @override
  State<AdminBottomNavigation> createState() => _AdminBottomNavigationState();
}

class _AdminBottomNavigationState extends State<AdminBottomNavigation> {
  final PersistentTabController _controller =
      PersistentTabController(initialIndex: 0);

  List<Widget> _buildScreens() {
    return [
      AdminHomeScreen(),
      DefaultersSceen(),
      ManageComplaintsScreen(),
      AdminWaterUsageScreen(),
      PaymentStatusScreen()
    ];
  }

  List<PersistentBottomNavBarItem> _navBarsItems() {
    double height = 25;
    double width = 25;
    return [
      PersistentBottomNavBarItem(
        icon: Icon(Icons.home, size: 25),
        inactiveIcon: Icon(Icons.home_outlined, size: 25),
        title: "Home",
        activeColorPrimary: CupertinoColors.activeBlue,
        inactiveColorPrimary: CupertinoColors.systemGrey,
      ),
      PersistentBottomNavBarItem(
        icon: Icon(Icons.warning, size: 25),
        inactiveIcon:
            Icon(Icons.system_security_update_warning_rounded, size: 25),
        title: "Defaulters",
        activeColorPrimary: CupertinoColors.activeBlue,
        inactiveColorPrimary: CupertinoColors.systemGrey,
      ),
      PersistentBottomNavBarItem(
          icon: Icon(
            Icons.warning_outlined,
            size: 25,
            color: AppColor.white,
          ),
          inactiveIcon: Icon(
            Icons.warning_outlined,
            size: 25,
            color: AppColor.white,
          ),
          title: "Complaints",
          activeColorPrimary: CupertinoColors.activeBlue,
          inactiveColorPrimary: CupertinoColors.systemGrey),
      PersistentBottomNavBarItem(
        icon: Icon(Icons.water_drop, size: 25),
        inactiveIcon: Icon(Icons.water_drop_outlined, size: 25),
        title: "Water Usage",
        activeColorPrimary: CupertinoColors.activeBlue,
        inactiveColorPrimary: CupertinoColors.systemGrey,
      ),
      PersistentBottomNavBarItem(
        icon: Icon(Icons.payment, size: 25),
        inactiveIcon: Icon(Icons.payment_outlined, size: 25),
        title: "PayStatus",
        activeColorPrimary: CupertinoColors.activeBlue,
        inactiveColorPrimary: CupertinoColors.systemGrey,
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PersistentTabView(
        context,
        controller: _controller,
        screens: _buildScreens(),
        items: _navBarsItems(),
        handleAndroidBackButtonPress: true,
        resizeToAvoidBottomInset: false,
        hideNavigationBarWhenKeyboardAppears: true,
        popBehaviorOnSelectedNavBarItemPress: PopBehavior.all,
        backgroundColor: AppColor.white,
        animationSettings: const NavBarAnimationSettings(
          navBarItemAnimation: ItemAnimationSettings(
            duration: Duration(milliseconds: 300),
            curve: Curves.easeInOut,
          ),
          screenTransitionAnimation: ScreenTransitionAnimationSettings(
            animateTabTransition: true,
            duration: Duration(milliseconds: 300),
            screenTransitionAnimationType: ScreenTransitionAnimationType.slide,
          ),
        ),
        confineToSafeArea: true,
        navBarHeight: kBottomNavigationBarHeight + 5,
        navBarStyle: NavBarStyle.style15,
      ),
    );
  }
}
