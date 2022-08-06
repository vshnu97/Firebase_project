import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_project/login/viewmodel/auth_prov.dart';
import 'package:firebase_project/login/viewmodel/login.dart';
import 'package:firebase_project/main_page/screen_main.dart';
import 'package:firebase_project/routes/navigator.dart';
import 'package:firebase_project/sign_up/view_model/auth_provider.dart';
import 'package:firebase_project/sign_up/view_model/sign_up.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main(List<String> args) async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider<LoginProv>(create: ((context) => LoginProv())),
    ChangeNotifierProvider<SignUpProv>(create: ((context) => SignUpProv())),
    ChangeNotifierProvider<SignUpAuthPro>(
        create: ((context) => SignUpAuthPro(FirebaseAuth.instance))),
    ChangeNotifierProvider<AuthenticationProv>(
        create: ((context) => AuthenticationProv(FirebaseAuth.instance))),
    StreamProvider(
        create: (context) => context.watch<AuthenticationProv>().stream(),
        initialData: null)
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
      home: const ScreenMain(),
    );
  }
}
