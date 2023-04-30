import 'package:flutter/material.dart';
import 'package:news_app/constants/colors.dart';

class InfoCard extends StatelessWidget {
  // the values we need
  final String text;
  final IconData icon;

  const InfoCard(
      {super.key, required this.text, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Card(
        color: Colors.white,
        margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 25),
        child: ListTile(
          leading: Icon(
            icon,
            color: AppColors.lightGrey,
          ),
          title: Text(
            text,
            style: const TextStyle(
                color: AppColors.lightGrey,
                fontSize: 20,
                fontFamily: 'Source Sans Pro'),
          ),
        ),
      );
  }
}