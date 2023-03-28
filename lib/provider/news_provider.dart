import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:news_app/widgets/news_preview.dart';
import '../news_model/news.dart';

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
    loadNewsList();
  }

  void loadNewsList() async{
    state = state.copyWith(isLoading: true);

    final testModel = NewsModel(
      source: Source("cbs-news", "CBS News"),
      title: "Pet insurance for cats: What to know",
      description:
      "Pet insurance for cats depends on a variety of factors. Here's what you should know about protecting your cat.",
      url: "https://www.cbsnews.com/news/pet-insurance-for-cats-what-to-know/",
      urlToImage:
      "https://assets1.cbsnewsstatic.com/hub/i/r/2022/11/02/9bfcf26b-6f1f-4462-bfd5-6e7fb2e380da/thumbnail/1200x630/b4c10958124033d922668e6f4e812322/gettyimages-1337031863.jpg",
      content:
      "Pet insurance for cats depends on a variety of factors.\r\nGetty Images\r\nOwning a cat can be rewarding for pet owners, but it can also be stressful (and expensive). If your pet gets sick or has other h… [+5381 chars]",
    );

    List<NewsPreview> tempNews = [];
    for (var i = 0; i < 3; i++){
      tempNews.add(NewsPreview(newsModel: testModel));
    }

    state = state.copyWith(news: tempNews, isLoading: false);
  }

  void changeFavoritesOnlyFlag() {
    state = state.copyWith(favoritesOnlyFlag: !state.favoritesOnlyFlag);
  }
}
