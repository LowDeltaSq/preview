import 'package:flutter/cupertino.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:preview/src/router/router.dart';
import 'package:preview/src/screens/auth/login/login_screen.dart';

void main() async {
  await Hive.initFlutter();
  await Hive.openBox('tokens');
  runApp(
    MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const CupertinoApp(
      debugShowCheckedModeBanner: false,
      onGenerateRoute: AppRouter.generateRoute,
      home: LoginScreen(),
    );
  }
}