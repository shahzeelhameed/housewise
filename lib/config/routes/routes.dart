import 'package:flutter/material.dart';
import 'package:housewise/admin-features/admin-create-user/presentation/admin_create_user.dart';
import 'package:housewise/admin-features/admin-user-req/presentation/admin_user_request.dart';
import 'package:housewise/admin-features/admin-water-usage/presentation/admin-water-usage_screen.dart';
import 'package:housewise/admin-features/admin_bottom_navigation.dart';
import 'package:housewise/config/routes/routes_name.dart';
import 'package:housewise/dosmestic/home/presentation/domestic_homr_screen.dart';
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
      // Add other routes here
      case RoutesName.ADMIN_BOTTOM_NAVIGATION:
        return MaterialPageRoute(builder: (context) => AdminBottomNavigation());

      case RoutesName.ADMIN_BOTTOM_NAVIGATION:
        return MaterialPageRoute(builder: (context) => AdminBottomNavigation());
      case RoutesName.ADMIN_USER_REQUEST:
        return MaterialPageRoute(builder: (context) => AdminUserRequest());
      case RoutesName.ADMIN_CREATE_USER:
        return MaterialPageRoute(builder: (context) => AdminCreateUser());
      case RoutesName.ADMIN_WATER_USAGE:
        return MaterialPageRoute(builder: (context) => AdminWaterUsageScreen());
      case RoutesName.DOMESTIC_HOME:
        return MaterialPageRoute(builder: (context) => DomesticHomeScreen());
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
