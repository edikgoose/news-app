import 'package:news_app/news_model/countries.dart';
import 'package:news_app/news_model/category.dart';

class SearchParameters{
    Country? country;
    String query;
    SearchCategory? category;

    SearchParameters(this.country, this.query, this.category);
}