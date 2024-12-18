import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:preview/src/router/router_const.dart';
import 'package:preview/src/screens/auth/register/register_screen.dart';

void registerValid(BuildContext context) async {
  String login = loginController.text;
  String email = emailController.text;
  String password = passwordController.text;

  if (!RegExp(r"^[a-zA-Z0-9._-]+@[a-zA-Z0-9]+\.[a-zA-Z]{2,6}$")
      .hasMatch(email)) {
    _showErrorDialog(context, 'Введите корректный email');
    return;
  }

  if (password.length < 8) {
    _showErrorDialog(context, 'Пароль должен содержать минимум 8 символов');
    return;
  }

  Dio dio = Dio();
  String baseUrl = 'http://10.0.2.2:53000/register';

  try {
    Response response = await dio.post(
      baseUrl,
      data: {
        'login': login,
        'mail': email,
        'password': password,
      },
    );

    if (response.statusCode == 201) {
      Navigator.pushNamed(context, LoginRoute);
    } else {
      _showErrorDialog(context, 'Ошибка регистрации');
    }
  } on DioException catch (e) {
    _showErrorDialog(context, 'Такой аккаунт уже зарегистрирован');
  }
}

void _showErrorDialog(BuildContext context, String message) {
  showCupertinoDialog(
    context: context,
    builder: (context) {
      return CupertinoAlertDialog(
        title: const Text('Ошибка'),
        content: Text(message),
        actions: [
          CupertinoDialogAction(
            child: const Text('Ok'),
            onPressed: () => Navigator.pop(context),
          ),
        ],
      );
    },
  );
}
