import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:hive/hive.dart';
import 'package:preview/src/router/router_const.dart';
import 'package:preview/src/screens/auth/login/login_screen.dart';

void loginValid(BuildContext context) async {
  String email = emailController.text;
  String password = passwordController.text;

  Box tokensBox = await Hive.openBox('tokens');

  Dio dio = Dio();
  String baseUrl = 'http://10.0.2.2:53000';

  try {
    Response response = await dio.post('$baseUrl/login', data: {
      'mail': email,
      'password': password,
    });

    if (response.data != null && response.data['token'] != null) {
      tokensBox.put('access', response.data['token']);
      Navigator.pushNamed(context, MainRoute);
    } else {
      _showErrorDialog(context, 'Ответ от сервера пустой');
    }
  } on DioException {
    _showErrorDialog(context, 'Неверный логин или пароль');
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
