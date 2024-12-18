import 'package:flutter/cupertino.dart';
import 'package:preview/src/screens/auth/login/login_screen.dart';
import 'package:preview/src/screens/auth/register/register_screen.dart';
import 'package:preview/src/screens/main/basket/basket_screen.dart';
import 'package:preview/src/screens/main/profile/profile_screen.dart';
import 'package:preview/src/router/router_const.dart';
import 'package:preview/src/screens/main_screen.dart';

class AppRouter {
  static Route generateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case LoginRoute:
        return CupertinoPageRoute(builder: (context) => const LoginScreen());
      case RegisterRoute:
        return CupertinoPageRoute(builder: (context) => RegisterScreen());
      case MainRoute:
        return CupertinoPageRoute(builder: (context) => const MainScreen());
      case BasketRoute:
        return CupertinoPageRoute(builder: (context) => const BasketScreen());
      case ProfileRoute:
        return CupertinoPageRoute(builder: (context) => const ProfileScreen());
      default:
        return CupertinoPageRoute(builder: (context) => const LoginScreen());
    }
  }
}
