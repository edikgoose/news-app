import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:news_app/pages/profile_page.dart';
import 'package:news_app/provider/news_provider.dart';

class MyHomePage extends ConsumerWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final favoritesOnlyFlag = ref.watch(newsProvider).favoritesOnlyFlag;
    final newsList = ref.watch(newsProvider).news;

    return Scaffold(
      body: Column(
        children: [
          const SizedBox(
            height: 30,
          ),
          Row(
            children: [
              IconButton(
                onPressed: () =>
                    Navigator.of(context).push(_createRouteProfile()),
                icon: const Icon(Icons.person),
              ),
              const Spacer(),
              IconButton(
                onPressed:
                    ref.read(newsProvider.notifier).changeFavoritesOnlyFlag,
                icon: favoritesOnlyFlag
                    ? const Icon(Icons.bookmark)
                    : const Icon(Icons.bookmark_border),
              ),
            ],
          ),
          Expanded(
            child: ListView(
              children: newsList,
            ),
          ),
        ],
      ),
    );
  }
}

Route _createRouteProfile() {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) =>
        const ProfilePage(),
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      const begin = Offset(1.0, 0.0);
      const end = Offset.zero;
      const curve = Curves.ease;

      var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

      return SlideTransition(
        position: animation.drive(tween),
        child: child,
      );
    },
  );
}
