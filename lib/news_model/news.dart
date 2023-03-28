class Source{
    String id;
    String name;
    Source(
        this.id,
        this.name,
    );
}

class NewsModel {
    final Source source;
    final String title;
    final String description;
    final String url;
    String? urlToImage;
    final String content;

    NewsModel({
        required this.source,
        required this.title,
        required this.description,
        required this.url,
        required this.content,
        this.urlToImage
    });
}
// Future<List<News>> fetchNews(Request r) async{
//     
// 
// }