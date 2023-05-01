import 'package:news_app/news_model/category.dart';
import 'package:news_app/news_model/request.dart';
import 'package:news_app/repository/news_repository.dart';
import 'package:test/test.dart';

void main() {
  group('Url generator', () {
    test('url should contain all parameters', () {
      NewsRepository newsRepository = NewsRepository(apiKey: 'key');
      SearchParameters searchParameters = SearchParameters(null, 'content', SearchCategory.business);
      expect('https://newsapi.org/v2/top-headlines?apiKey=key&q=content&category=business',
          newsRepository.convertToUrlString(searchParameters));
    });

    test('url should not contain all parameters', () {
      NewsRepository newsRepository = NewsRepository(apiKey: 'key');
      SearchParameters searchParameters = SearchParameters(null, '', SearchCategory.none);
      expect('https://newsapi.org/v2/top-headlines?apiKey=key&q=world',
          newsRepository.convertToUrlString(searchParameters));
    });

  });
}