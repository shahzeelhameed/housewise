import 'package:flutter/material.dart';
import 'package:housewise/config/routes/routes_name.dart';
import 'package:housewise/features/auth/login/login_screen.dart';
import 'package:housewise/features/auth/signup/signup_screen.dart';
import 'package:housewise/features/bottom_navigation.dart';
import 'package:housewise/features/request-maintaince/presentation/screens/request_maintaince_screen.dart';
import 'package:housewise/features/water-usage/presentation/screens/water_usage_screen.dart';

class Routes {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RoutesName.REQUEST_MAINTENANCE:
        return MaterialPageRoute(
            builder: (context) => RequestMaintainceScreen());
      case RoutesName.WATER_USAGE:
        return MaterialPageRoute(builder: (context) => WaterUsageScreen());
      case RoutesName.BOTTOM_NAVIGATION:
        return MaterialPageRoute(builder: (context) => BottomNavigation());
      case RoutesName.LOGIN:
        return MaterialPageRoute(builder: (context) => LoginScreen());

      case RoutesName.SIGNUP:
        return MaterialPageRoute(builder: (context) => SignUpScreen());
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(
              child: Text('No route defined for ${settings.name}'),
            ),
          ),
        );
    }
  }
}
