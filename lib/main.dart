import 'package:firebase_project/login/view/screen_home.dart';
import 'package:firebase_project/login/viewmodel/login.dart';
import 'package:firebase_project/routes/navigator.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main(List<String> args) {
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider<LoginProv>(
      create: ((context) => LoginProv()),
    )
  ], child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: Routes.navigationKey, // navigation
      debugShowCheckedModeBanner: false,
      theme: ThemeData(splashFactory: InkRipple.splashFactory),
      home: const ScreenHome(),
    );
  }
}
