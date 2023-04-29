import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:flutterfire_ui/auth.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../constants/colors.dart';
import 'home_page.dart';

class AuthPage extends ConsumerWidget {
  const AuthPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        iconTheme: const IconThemeData(
          color: Colors.white, //change your color here
        ),
        backgroundColor: Colors.black45,
        title: const Text("News", style: TextStyle(color: Colors.white),),
        automaticallyImplyLeading: false,
      ),
      body: const Text("Auth", style: TextStyle(color: Colors.white),),
    );
    // return StreamBuilder<User?>(
    //   stream: FirebaseAuth.instance.authStateChanges(),
    //   builder: (context, snapshot) {
    //     if (!snapshot.hasData) {
    //       return SignInScreen(
    //         providerConfigs: const [
    //           EmailProviderConfiguration(),
    //         ],
    //       );
    //     }
    //     return MyHomePage();
    //   },
    // );
  }
}
