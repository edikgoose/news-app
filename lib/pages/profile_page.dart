import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:news_app/constants/colors.dart';

import '../news_model/user.dart';
import '../widgets/info_field_widget.dart';

class ProfilePage extends ConsumerWidget {
  final User user;

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
        ),
        body: SafeArea(
            minimum: const EdgeInsets.only(top: 50),
            child: Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
              Flexible(
                  flex: 9,
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
                  )
              ),
              Flexible(
                  flex: 1,
                  child: Container(
                    padding: const EdgeInsets.only(bottom: 25, left: 15, right: 15),
                    child: ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12))),
                        child: const Text(
                          "Log out",
                          style: TextStyle(
                            color: AppColors.lightGrey,
                            fontSize: 20,
                            fontFamily: "Source Sans Pro"),
                        )
                    ),
                  ))
            ])));
  }
}
