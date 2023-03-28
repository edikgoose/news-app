import 'package:flutter/material.dart';

import 'pages/home_page.dart';


void main() async {
  
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'News App',
      theme: ThemeData(
          useMaterial3: true,
          colorScheme: ColorScheme.fromSeed(seedColor: Color.fromRGBO(35, 34, 39, 100)),
        ),
      home: MyHomePage(),
    );
  }
}
