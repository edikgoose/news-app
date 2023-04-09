import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:news_app/constants/colors.dart';

class ProfilePage extends ConsumerWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        iconTheme: const IconThemeData(
          color: Colors.white, //change your color here
        ),
        backgroundColor: Colors.black45,
        title: const Text("Profile", style: TextStyle(color: Colors.white)),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(15),
          child: Column(
            children: const [
              SizedBox(height: 10),
              Text("Name Surname", style: TextStyle(color: Colors.white)),
              Text("Info", style: TextStyle(color: Colors.white)),
            ],
          ),
        ),
      ),
    );
  }
}
