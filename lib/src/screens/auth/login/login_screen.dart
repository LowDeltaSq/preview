import 'package:flutter/cupertino.dart';
import 'package:preview/UI/styles/login_style.dart';
import 'package:preview/src/common/widgets/custom_button.dart';
import 'package:preview/src/common/widgets/custom_field.dart';
import 'package:preview/src/router/router_const.dart';
import 'package:preview/src/screens/auth/login/valid/login_valid.dart';

final TextEditingController emailController = TextEditingController();
final TextEditingController passwordController = TextEditingController();
final TextEditingController loginController = TextEditingController();

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      backgroundColor: LoginStyle.backgroundColor,
      navigationBar: const CupertinoNavigationBar(
        backgroundColor: CupertinoColors.white,
        middle: Text('Вход'),
      ),
      child: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomTextField(
              placeholder: 'Почта',
              controller: emailController,
              obscureText: false,
            ),
            Container(
              height: 1,
              color: LoginStyle.borderColor,
              padding: LoginStyle.pagePadding,
            ),
            CustomTextField(
              placeholder: 'Пароль',
              controller: passwordController,
              obscureText: true,
            ),
            const SizedBox(
              height: 19,
            ),
            Padding(
              padding: LoginStyle.pagePadding,
              child: CustomButton(
                text: 'Вход',
                onPressed: () {
                  loginValid(context);
                },
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: LoginStyle.pagePadding,
              child: CustomButton(
                text: 'Регистрация',
                onPressed: () {
                  Navigator.pushNamed(context, RegisterRoute);
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}

