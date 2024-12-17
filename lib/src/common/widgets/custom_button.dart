import 'package:flutter/cupertino.dart';
import 'package:preview/UI/styles/login_style.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.text,
    required this.onPressed,
  });

  final String text;
  final onPressed;

  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
        padding: LoginStyle.buttonPadding,
        color: LoginStyle.buttonColor,
        onPressed: onPressed,
        child: Text(
          text,
          style: LoginStyle.buttonTextStyle,
        ));
  }
}
