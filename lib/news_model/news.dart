import 'request.dart';

class Source{
    String id;
    String name;
    Source(
        this.id,
        this.name,
    );
}

class News{
    Source source;
    String title;
    String description;
    String url;
    String? urlToImage;
    String content;

    News(
        this.source,
        this.title,
        this.description,
        this.url,
        this.urlToImage,
        this.content,
    );
}

// Future<List<News>> fetchNews(Request r) async{
//     
// 
// }