import 'package:news_app/news_model/countries.dart';
import 'package:news_app/news_model/category.dart';
import 'package:news_app/development/env.dart';

class Request{
    Country? country;
    String query;
    Category? category;

    Request(this.country, this.query, this.category);
}

String makeRequestString(Request r){
    String url = "https://newsapi.org/v2/top-headlines?q=${r.query}";
    if (r.category != null){
        url += "&category=${r.category.toString()}";
    }
    if (r.country != null){
        url += "&country=${r.country.toString()}";
    }
    url += "&apiKey=73e1a5bdd8f44bd78ce06c457b301a3e";

    return url;

}