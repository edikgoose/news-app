// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:flutter/material.dart';
// import 'package:flutterfire_ui/auth.dart';
// import 'package:firebase_auth/firebase_auth.dart';
//
// import 'home_page.dart';
//
// class AuthPage extends ConsumerWidget {
//   const AuthPage({super.key});
//
//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     return StreamBuilder<User?>(
//       stream: FirebaseAuth.instance.authStateChanges(),
//       builder: (context, snapshot) {
//         if (!snapshot.hasData) {
//           return SignInScreen(
//             providerConfigs: const [
//               EmailProviderConfiguration(),
//             ],
//           );
//         }
//         return MyHomePage();
//       },
//     );
//   }
// }
