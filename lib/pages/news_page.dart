import 'package:flutter/material.dart';

class NewsPage extends StatelessWidget {
  const NewsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(35, 34, 39, 1),
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(35, 34, 39, 1),
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
            color: Colors.white,
          ),
          onPressed: () => Navigator.of(context).pop(),
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.bookmark,
              color: Colors.white,
            ),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'В Москве пройдет благотворительная выставка-пристройство животных',
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Text(
              'На мероприятии своих хозяев будут ждать более сотни собак и кошек самых разных размеров, возрастов, окрасов и характеров. Все животные привиты, чипированы и отдаются в добрые руки абсолютно бесплатно прямо с мероприятия, сообщили в центре.',
              style: TextStyle(
                color: Colors.white,
                fontSize: 14,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Divider(
            color: Colors.black,
            thickness: 1,
            indent: 10,
            endIndent: 10,
          ),
          Row(
            children: [
              IconButton(
                icon: Icon(Icons.favorite_border, color: Color.fromRGBO(229, 64, 51, 1),),
                onPressed: () {}, // TODO: like
              ),
              Text(
                '1000',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                ),
              )
            ],
          ),
          Container(
            color: Color.fromRGBO(35, 34, 39, 1),
            child: ListView.builder(
              padding: const EdgeInsets.all(16.0),
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: 10,
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  padding: EdgeInsets.all(4),
                  margin: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                  decoration: BoxDecoration(
                    color: Color.fromRGBO(50, 49, 54, 1),
                    borderRadius: BorderRadius.circular(100),
                  ),
                  child: ListTile(
                    leading: Icon(Icons.account_circle),
                    title: Text(
                      'Автор комментария $index',
                      style: TextStyle(
                        color: Color.fromRGBO(148, 136, 204, 1),
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    subtitle: Text(
                      'Комментарий $index',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    ));
  }
}
