import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:news_app/news_model/category.dart';

import 'package:news_app/widgets/news_preview.dart';
import '../news_model/news.dart';
import '../news_model/request.dart';

import '../repository/news_repository.dart';

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
  NewsRepository newsRepository = NewsRepository();

  NewsNotifier() : super(const NewsState()) {
    loadNewsList(SearchParameters(null, '', SearchCategory.none));
  }

  void loadNewsList(SearchParameters r) async {
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
              'https://raw.githubusercontent.com/edikgoose/news-app/%2326/assets/images/no_picture.png';
        }
        if (news[i].description == null) {
          news[i].description = '';
        }

        tempNews.add(NewsPreview(newsModel: news[i]));
      }
    }
    state = state.copyWith(news: tempNews, isLoading: false);
  }

  void changeFavoritesOnlyFlag() {
    state = state.copyWith(favoritesOnlyFlag: !state.favoritesOnlyFlag);
  }

  Future<List<NewsModel>> fetchNews(SearchParameters r) async {
    return newsRepository.getNews(r);
  }
}
