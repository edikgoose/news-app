import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:news_app/constants/colors.dart';

import '../news_model/user.dart';
import '../widgets/info_field_widget.dart';
import 'auth_page.dart';

class ProfilePage extends ConsumerWidget {
  final UserModel user;

  const ProfilePage({required this.user, super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
        backgroundColor: AppColors.background,
        appBar: AppBar(
          iconTheme: const IconThemeData(
            color: Colors.white, //change your color here
          ),
          backgroundColor: Colors.black45,
          actions: <Widget>[
            PopupMenuButton<String>(
              color: Colors.white,
              onSelected: (String value) {
                switch (value) {
                  case 'Logout':
                    Navigator.of(context).push(_createRouteAuth());
                }
              },
              itemBuilder: (BuildContext context) {
                return [
                  PopupMenuItem<String>(
                    value: "Logout",
                    child: Row(
                      children: const [
                        Padding(padding: EdgeInsets.only(right: 10), child: Icon(Icons.logout, color: AppColors.lightGrey,)),
                        Text("Log Out", textAlign: TextAlign.center),
                      ],
                    ),
                  )
                ];
              },
            ),
          ],
        ),
        body: SafeArea(
          minimum: const EdgeInsets.only(top: 50),
          child: Column(
            children: <Widget>[
              // const CircleAvatar(
              //   radius: 50,
              //   backgroundImage: AssetImage('assets/images/app_icon.png'),
              // ),
              Text(
                "${user.name} ${user.surname}",
                style: const TextStyle(
                  fontSize: 40.0,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontFamily: "Pacifico",
                ),
              ),
              const SizedBox(
                height: 20,
                width: 320,
                child: Divider(
                  color: Colors.white,
                ),
              ),

              InfoCard(text: user.phone, icon: Icons.phone),
              InfoCard(text: user.nickname, icon: Icons.perm_identity),
              InfoCard(text: user.mail, icon: Icons.email),
            ],
          ),
        ));
  }

  Route _createRouteAuth() {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => const AuthPage(),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        const begin = Offset(-1.0, 0.0);
        const end = Offset.zero;
        const curve = Curves.ease;

        var tween =
            Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

        return SlideTransition(
          position: animation.drive(tween),
          child: child,
        );
      },
    );
  }
}
