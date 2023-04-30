import 'package:news_app/news_model/category.dart';
import 'package:news_app/news_model/countries.dart';

class Request{
    Country? country;
    String query;
    SearchCategory? category;

    Request(this.country, this.query, this.category);
}

String makeRequestString(Request r){
    const authority = "newsapi.org";
    const path = "/v2/top-headlines";
    final params = {'apiKey' : '73e1a5bdd8f44bd78ce06c457b301a3e'};

    if (r.query.isNotEmpty) {
        params['q'] = r.query;
    }
    if (r.category != null){
        params['category'] = r.category!.name;
    }
    if (r.country != null){
        params['country'] = r.country.toString();
    }

    return Uri.https(authority, path, params).toString();
}