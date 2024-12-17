import 'package:flutter/cupertino.dart';
import 'package:preview/src/router/router_const.dart';
import 'package:preview/src/screens/auth/login/login_screen.dart';
import 'package:preview/src/screens/auth/register/register_screen.dart';
import 'package:preview/src/screens/main_screen.dart';

class AppRouter {
  static Route generateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case LoginRoute:
        return CupertinoPageRoute(builder: (context) => const LoginScreen());
      case RegisterRoute:
        return CupertinoPageRoute(builder: (context) => const RegisterScreen());
      case MainRoute:
        return CupertinoPageRoute(builder: (context) => const MainScreen());
      default:
        return CupertinoPageRoute(builder: (context) => const LoginScreen());
    }
  }
}
