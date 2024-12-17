import 'package:flutter/cupertino.dart';
import 'package:preview/UI/styles/register_style.dart';
import 'package:preview/src/common/widgets/custom_button.dart';
import 'package:preview/src/common/widgets/custom_field.dart';
import 'package:preview/src/screens/auth/register/valid/register_valid.dart';

final TextEditingController emailController = TextEditingController();
final TextEditingController passwordController = TextEditingController();
final TextEditingController loginController = TextEditingController();

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
        backgroundColor: RegisterStyle.backgroundColor,
        navigationBar: const CupertinoNavigationBar(
          backgroundColor: RegisterStyle.backgroundColor,
          middle: Text('Регистрация'),
        ),
        child: SafeArea(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            CustomTextField(
                placeholder: 'Логин',
                controller: loginController,
                obscureText: false),
            Container(
              height: 1,
              color: RegisterStyle.borderColor,
              padding: RegisterStyle.textFieldPadding,
            ),
            CustomTextField(
                placeholder: 'Почта',
                controller: emailController,
                obscureText: false),
            Container(
              height: 1,
              color: RegisterStyle.borderColor,
              padding: RegisterStyle.textFieldPadding,
            ),
            CustomTextField(
                placeholder: 'Пароль',
                controller: passwordController,
                obscureText: true),
            const SizedBox(
              height: 20,
            ),
            Padding(
                padding: RegisterStyle.pagePadding,
                child: CustomButton(
                    text: 'Регистрация',
                    onPressed: () {
                      registerValid(context);
                    }))
          ],
        )));
  }
}
