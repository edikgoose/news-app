import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:news_app/widgets/news_preview.dart';
import '../news_model/news.dart';
import '../news_model/request.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

part 'news_provider.freezed.dart';

// Creating state where the freezed annotation will suggest that boilerplate code needs to be generated
@freezed
abstract class NewsState with _$NewsState {
  const factory NewsState({
    @Default([]) List<NewsPreview> news,
    @Default(true) isLoading,
    @Default(false) favoritesOnlyFlag,
  }) = _NewsState;

  const NewsState._();
}

final newsProvider =
    StateNotifierProvider<NewsNotifier, NewsState>((ref) => NewsNotifier());

class NewsNotifier extends StateNotifier<NewsState> {
  NewsNotifier() : super(const NewsState()) {
    loadNewsList(Request(null, "Trump", null));
  }

  void loadNewsList(Request r) async {
    state = state.copyWith(isLoading: true);
    List<NewsModel> newsList = [];
    Future<List<NewsModel>> futureNewsList =
        fetchNews(r);
    futureNewsList.then((value) {
      newsList = value;
    }).whenComplete(() => generateNewsPreview(newsList));
  }

  void generateNewsPreview(List<NewsModel> news) {
    List<NewsPreview> tempNews = [];
    for (var i = 0; i < news.length; i++) {
      if (news[i].content != null) {
        if (news[i].urlToImage == null) {
          news[i].urlToImage =
              "https://github.com/edikgoose/news-app/tree/main/assets/images";
        }
        if (news[i].description == null) {
          news[i].description = "";
        }

        tempNews.add(NewsPreview(newsModel: news[i]));
      }
    }
    state = state.copyWith(news: tempNews, isLoading: false);
  }

  void changeFavoritesOnlyFlag() {
    state = state.copyWith(favoritesOnlyFlag: !state.favoritesOnlyFlag);
  }

  Future<List<NewsModel>> fetchNews(Request r) async {
    List<NewsModel> listOfNews = [];
    String url = makeRequestString(r);
    var data = await http.get(Uri.parse(url));
    if (data.statusCode == 200) {
      var articles = jsonDecode(data.body)["articles"];
      if (articles.length > 0) {
        for (var news in articles) {
          listOfNews.add(NewsModel.fromJson(news));
        }
      }
      return listOfNews;
    } else {
      throw Exception('Loading failed');
    }
  }
}
