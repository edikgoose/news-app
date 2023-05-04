// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'news.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NewsModel _$NewsModelFromJson(Map<String, dynamic> json) => NewsModel(
      source: Source.fromJson(json['source'] as Map<String, dynamic>),
      title: json['title'] as String,
      description: json['description'] as String?,
      url: json['url'] as String,
      content: json['content'] as String?,
      urlToImage: json['urlToImage'] as String?,
    );

Map<String, dynamic> _$NewsModelToJson(NewsModel instance) => <String, dynamic>{
      'source': instance.source.toJson(),
      'title': instance.title,
      'description': instance.description,
      'url': instance.url,
      'urlToImage': instance.urlToImage,
      'content': instance.content,
    };
