import 'package:flutter/material.dart';


class NewsPage extends StatelessWidget {
  const NewsPage({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
        body: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'В Москве пройдет благотворительная выставка-пристройство животных',
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Text(
                  'На мероприятии своих хозяев будут ждать более сотни собак и кошек самых разных размеров, возрастов, окрасов и характеров. Все животные привиты, чипированы и отдаются в добрые руки абсолютно бесплатно прямо с мероприятия, сообщили в центре.',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Row(
                children: [
                  IconButton(
                    icon: Icon(Icons.favorite_border),
                    onPressed: () {}, // TODO: like
                  ),
                  Text(
                    '1000',
                    style: TextStyle(
                      fontSize: 10,
                      fontWeight: FontWeight.bold,
                    ),

                  )
                ],
              ),
              Expanded(
                child: ListView.builder(
                  padding: const EdgeInsets.all(16.0),
                  itemCount: 10,
                  itemBuilder: (BuildContext context, int index) {
                  return ListTile(
                    leading: Icon(Icons.account_circle),
                    title: Text('Автор комментария $index'),
                    subtitle: Text('Комментарий $index'),
                  );
                },
              ),
              ),
            ],
            
            )
          
    );
  }
}
