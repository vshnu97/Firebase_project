import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_project/login/view/screen_home.dart';
import 'package:firebase_project/login/viewmodel/auth_prov.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ScreenMain extends StatelessWidget {
  const ScreenMain({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
        stream: context.watch<AuthenticationProv>().stream(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return const ScreenHome();
          }
          return Scaffold(
            appBar: AppBar(
              title: const Text('Home'),
              actions: [
                IconButton(
                  onPressed: () {
                    context.read<AuthenticationProv>().signOut();
                  },
                  icon: const Icon(Icons.logout_outlined),
                  splashRadius: 20,
                )
              ],
            ),
            body: const Center(child: Text('Data')),
          );
        });
  }
}
