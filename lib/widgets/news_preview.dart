import 'package:flutter/material.dart';
import 'package:news_app/news_model/news.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../pages/full_text_page.dart';

class NewsPreview extends ConsumerWidget {
  final NewsModel newsModel;

  const NewsPreview({
    Key? key,
    required this.newsModel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(_createRoute(newsModel));
      },
      child: Container(
        margin: const EdgeInsets.only(bottom: 24),
        width: MediaQuery.of(context).size.width,
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          alignment: Alignment.bottomCenter,
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
              bottomRight: Radius.circular(6),
              bottomLeft: Radius.circular(6),
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              ClipRRect(
                  borderRadius: BorderRadius.circular(6),
                  child: loadPicture(context, newsModel.urlToImage!)
              ),
              const SizedBox(
                height: 12,
              ),
              Text(
                newsModel.title,
                maxLines: 2,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 4,
              ),
              Text(
                newsModel.description!,
                maxLines: 2,
                style: const TextStyle(
                  color: Colors.grey,
                  fontSize: 14,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

Image loadPicture(context, String url) {
  Image img;

  try {
    img = Image.network(
      url,
      height: 200,
      width: MediaQuery.of(context).size.width,
      fit: BoxFit.cover,
      errorBuilder: (context, error, stackTrace) {
        return Container(
          color: Colors.amber,
          alignment: Alignment.center,
          child: Image.network(
                "https://raw.githubusercontent.com/edikgoose/news-app/main/assets/images/no_picture.png",
                height: 200,
                width: MediaQuery.of(context).size.width,
                fit: BoxFit.cover)
        );
      },
    );
  } on Exception catch (err) {
    print(err);
    img = Image.network(
      "https://raw.githubusercontent.com/edikgoose/news-app/main/assets/images/no_picture.png",
      height: 200,
      width: MediaQuery.of(context).size.width,
      fit: BoxFit.cover,
    );
  } on Error catch (err) {
    print(err);
    img = Image.network(
      "https://raw.githubusercontent.com/edikgoose/news-app/main/assets/images/no_picture.png",
      height: 200,
      width: MediaQuery.of(context).size.width,
      fit: BoxFit.cover,
    );
  }
  return img;
}

Route _createRoute(NewsModel newsModel) {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) =>
        FullTextPage(newsModel: newsModel),
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
