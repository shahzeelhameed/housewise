import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
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
  bool _imagesPrecached = false; // Flag for precaching images
  final bool _snackBarShown = false; // Flag to show SnackBar only once

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    // Precache images
    if (!_imagesPrecached) {
      precacheImage(const AssetImage("assets/icons/Home.png"), context);
      precacheImage(const AssetImage("assets/icons/Home (2).png"), context);
      precacheImage(const AssetImage("assets/icons/My Bills.png"), context);
      precacheImage(const AssetImage("assets/icons/My Bills (2).png"), context);
      precacheImage(const AssetImage("assets/icons/Pay Now (2).png"), context);
      precacheImage(const AssetImage("assets/icons/Pay Now.png"), context);
      precacheImage(const AssetImage("assets/icons/Complaint.png"), context);
      precacheImage(
          const AssetImage(
              "assets/icons/WhatsApp Image 2025-04-28 at 8.12.33 PM.jpeg"),
          context);
      precacheImage(
          const AssetImage("assets/icons/Contact Team (2).png"), context);
      precacheImage(const AssetImage("assets/icons/Contact Team.png"), context);
      _imagesPrecached = true;
    }

    // Show SnackBar after the first frame is drawn
  }

  List<Widget> _buildScreens() {
    return const [
      HomeScreen(),
      BillsScreen(),
      ComplaintScreen(),
      PayNowScreen(),
      ContactTeamScreen(),
    ];
  }

  List<PersistentBottomNavBarItem> _navBarsItems() {
    double height = 25;
    double width = 25;
    return [
      PersistentBottomNavBarItem(
        icon: SizedBox(
          height: height,
          width: width,
          child: Image.asset(
            "assets/icons/Home.png",
            fit: BoxFit.cover,
            gaplessPlayback: true,
          ),
        ),
        inactiveIcon: SizedBox(
          height: height,
          width: width,
          child: Image.asset(
            "assets/icons/Home (2).png",
            fit: BoxFit.cover,
            gaplessPlayback: true,
          ),
        ),
        title: "Home",
        activeColorPrimary: CupertinoColors.activeBlue,
        inactiveColorPrimary: CupertinoColors.systemGrey,
      ),
      PersistentBottomNavBarItem(
        icon: SizedBox(
          height: height,
          width: width,
          child: Image.asset(
            "assets/icons/My Bills.png",
            fit: BoxFit.cover,
            gaplessPlayback: true,
          ),
        ),
        inactiveIcon: SizedBox(
          height: height,
          width: width,
          child: Image.asset(
            "assets/icons/My Bills (2).png",
            fit: BoxFit.cover,
            gaplessPlayback: true,
          ),
        ),
        title: "Bills",
        activeColorPrimary: CupertinoColors.activeBlue,
        inactiveColorPrimary: CupertinoColors.systemGrey,
      ),
      PersistentBottomNavBarItem(
        icon: SizedBox(
          height: height,
          width: width,
          child: Image.asset(
            "assets/icons/Complaint.png",
            fit: BoxFit.contain,
            gaplessPlayback: true,
          ),
        ),
        title: "Complaint",
        activeColorPrimary: CupertinoColors.activeBlue,
        inactiveColorPrimary: CupertinoColors.systemGrey,
      ),
      PersistentBottomNavBarItem(
        icon: SizedBox(
          height: height,
          width: width,
          child: Image.asset(
            "assets/icons/Pay Now (2).png",
            fit: BoxFit.cover,
            gaplessPlayback: true,
          ),
        ),
        inactiveIcon: SizedBox(
          height: height,
          width: width,
          child: Image.asset(
            "assets/icons/Pay Now.png",
            fit: BoxFit.cover,
            gaplessPlayback: true,
          ),
        ),
        title: "Pay Now",
        activeColorPrimary: CupertinoColors.activeBlue,
        inactiveColorPrimary: CupertinoColors.systemGrey,
      ),
      PersistentBottomNavBarItem(
        icon: SizedBox(
          height: height,
          width: width,
          child: Image.asset(
            "assets/icons/Contact Team (2).png",
            fit: BoxFit.cover,
            gaplessPlayback: true,
          ),
        ),
        inactiveIcon: SizedBox(
          height: height,
          width: width,
          child: Image.asset(
            "assets/icons/Contact Team.png",
            fit: BoxFit.cover,
            gaplessPlayback: true,
          ),
        ),
        title: "Team",
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
