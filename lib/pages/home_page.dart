import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:news_app/constants/colors.dart';
import 'package:news_app/pages/profile_page.dart';
import 'package:news_app/provider/news_provider.dart';
import 'package:news_app/widgets/search_bar_widget.dart';

import '../news_model/user.dart';
import '../provider/connection_provider.dart';

bool disposed = false;

class MyHomePage extends ConsumerWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final con = ref.watch(connectivityStatusProviders).curStatus;
    ref.read(connectivityStatusProviders.notifier).checkConnection();

    if (con == Statuses.isDisonnected || con == Statuses.notDetermined) {
      disposed = true;
      return Scaffold(
          backgroundColor: AppColors.background,
          body: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                SizedBox(
                  width: double.infinity,
                  height: 50,
                ),
                Text(
                  'No internet connection',
                  style: TextStyle(color: Colors.white, fontSize: 35),
                )
              ]));
    } else {
      if (disposed) {
        disposed = false;
      }
      final favoritesOnlyFlag = ref.watch(newsProvider).favoritesOnlyFlag;

      final newsList = ref.watch(newsProvider).news;

      return Scaffold(
        backgroundColor: AppColors.background,
        appBar: AppBar(
          backgroundColor: Colors.black45,
          actions: [
            IconButton(
              onPressed: () =>
                  Navigator.of(context).push(_createRouteProfile()),
              icon: const Icon(
                Icons.person,
                color: Colors.white,
              ),
            ),
            SearchBarWidget(
                searchRequestCallback: (searchRequest) => ref.read(newsProvider.notifier).loadNewsList(searchRequest),
            ),
            IconButton(
              onPressed:
                  ref.read(newsProvider.notifier).changeFavoritesOnlyFlag,
              icon: favoritesOnlyFlag
                  ? const Icon(
                      Icons.bookmark,
                      color: Colors.white,
                    )
                  : const Icon(Icons.bookmark_border, color: Colors.white),
            ),
          ],
        ),
        body: Column(
          children: [
            const SizedBox(
              height: 20,
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
}

Route _createRouteProfile() {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) => ProfilePage(
        user: UserModel("Name", 'Surname', 'alias', '+77777777777',
            FirebaseAuth.instance.currentUser!.email.toString())),
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      const begin = Offset(-1.0, 0.0);
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
