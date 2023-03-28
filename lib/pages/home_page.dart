import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

bool favoritesOnlyFlag =
    false; // TODO move inside build func and use provider.watch()

class MyHomePage extends ConsumerWidget {
  const MyHomePage({super.key});

  void _navigateToNews() {
    print("navigate to news screen");
  }

  void _navigateToProfile() {
    print("navigate to profile");
  }

  void _changeFavoritesOnlyFlag() {
    favoritesOnlyFlag = !favoritesOnlyFlag;
    print("Change favorites flag to $favoritesOnlyFlag");
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: Column(
        children: [
          Row(
            children: [
              IconButton(
                onPressed: _navigateToProfile,
                icon: Icon(Icons.person),
              ),
              Spacer(),
              IconButton(
                onPressed: _changeFavoritesOnlyFlag,
                icon: favoritesOnlyFlag
                    ? Icon(Icons.bookmark)
                    : Icon(Icons.bookmark_border),
              ),
            ],
          ),
          Text("Home page"),
          FloatingActionButton(onPressed: _navigateToNews),
        ],
      ),
    );
  }
}
