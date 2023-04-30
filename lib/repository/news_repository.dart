import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:news_app/news_model/category.dart';

import '../news_model/news.dart';
import '../news_model/request.dart';
import 'package:http/http.dart' as http;

class NewsRepository {
  String? apiKey;

  NewsRepository.withKey(this.apiKey);

  NewsRepository() {
    if (String.fromEnvironment('API_KEY').isEmpty) {
      if (dotenv.isInitialized) {
        apiKey = dotenv.env['API_KEY'] ?? 'key';
      }
      throw FlutterError('No API key is specified');
    }
  }

  Future<List<NewsModel>> getNews(SearchParameters r) async {
    List<NewsModel> listOfNews = [];
    String url = convertToUrlString(r);
    print(url);
    var data = await http.get(Uri.parse(url));
    if (data.statusCode == 200) {
      var articles = jsonDecode(data.body)['articles'];
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

  String convertToUrlString(SearchParameters r) {
    const authority = 'newsapi.org';
    const path = '/v2/top-headlines';
    final params = {'apiKey' : apiKey};

    if (r.query.isNotEmpty) {
      params['q'] = r.query;
    }
    if (r.query.isEmpty && r.category == SearchCategory.none) {
      params['q'] = 'world';
    }
    if (r.category != SearchCategory.none){
      params['category'] = r.category!.name;
    }
    if (r.country != null){
      params['country'] = r.country.toString();
    }

    return Uri.https(authority, path, params).toString();
  }
}