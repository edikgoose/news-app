import 'package:json_annotation/json_annotation.dart';
import 'package:news_app/news_model/source.dart';
part 'news.g.dart';

@JsonSerializable(explicitToJson: true)
class NewsModel {
    Source source;
    String title;
    String? description;
    String url;
    String? urlToImage;
    String? content;

    NewsModel({
        required this.source,
        required this.title,
        this.description,
        required this.url,
        this.content,
        this.urlToImage
    });
    NewsModel.fromJson(Map<String, dynamic> json)
      : source = Source.fromJson(json),
        title = json['title'],
        description = json['description'],
        url = json['url'],
        content = json['content'],
        urlToImage = json['urlToImage'];
    // Map<String,dynamic> toJson() => _$NewsModelToJson(this);
}