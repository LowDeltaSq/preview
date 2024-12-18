import 'package:flutter/cupertino.dart';
import 'package:preview/src/router/router_const.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: const CupertinoNavigationBar(
        middle: Text('Профиль'),
      ),
      child: SafeArea(
        child: Column(
          children: [
            const Center(
              child: Icon(
                CupertinoIcons.profile_circled,
                color: CupertinoColors.black,
                size: 150,
              ),
            ),
            const SizedBox(height: 15),
            const Text(
              'Ваш профиль',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: CupertinoColors.black,
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            const Text(
              'Тут информация о вас',
              style: TextStyle(
                fontWeight: FontWeight.w300,
                color: CupertinoColors.systemGrey,
              ),
            ),
            const Spacer(),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: CupertinoButton.filled(
                child: const Text('Выйти'),
                onPressed: () {
                  Navigator.pushNamedAndRemoveUntil(
                    context,
                    LoginRoute,
                    (route) => false,
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
