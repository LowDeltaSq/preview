import 'package:flutter/cupertino.dart';
import 'package:preview/UI/styles/login_style.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    required this.placeholder,
    required this.controller,
    required this.obscureText,
  });

  final String placeholder;
  final TextEditingController controller;
  final bool obscureText;

  @override
  Widget build(BuildContext context) {
    return CupertinoTextField(
        placeholder: placeholder,
        controller: controller,
        obscureText: obscureText,
        padding: LoginStyle.textFieldPadding,
        decoration: const BoxDecoration(
          color: LoginStyle.textFieldBackgroundColor,
        ));
  }
}
