import 'package:flutter/cupertino.dart';
import 'package:preview/src/screens/auth/login/login_screen.dart';
import 'package:preview/src/screens/main/basket/basket_screen.dart';
import 'package:preview/src/screens/main/catalog/catalog_screen.dart';
import 'package:preview/src/screens/main/profile/profile_screen.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: CupertinoTabScaffold(
          tabBar: CupertinoTabBar(items: const [
            BottomNavigationBarItem(
                icon: Icon(CupertinoIcons.home), label: 'Каталог'),
            BottomNavigationBarItem(
                icon: Icon(CupertinoIcons.gift), label: 'Корзина'),
            BottomNavigationBarItem(
                icon: Icon(CupertinoIcons.person), label: 'Профиль'),
          ]),
          tabBuilder: (context, index) {
            return CupertinoTabView(
              builder: (context) {
                switch (index) {
                  case 0:
                    return const CatalogScreen();
                  case 1:
                    return const BasketScreen();
                  case 2:
                    return const ProfileScreen();
                  default:
                    return const LoginScreen();
                }
              },
            );
          }),
    );
  }
}
