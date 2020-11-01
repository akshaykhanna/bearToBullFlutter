import 'package:flutter/material.dart';
import 'package:starter_flutter/news.dart';

class NewsListItems extends StatelessWidget {
  const NewsListItems({
    Key key,
    @required List<News> newsList,
  })  : _newsList = newsList,
        super(key: key);

  final List<News> _newsList;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: _newsList.length,
      itemBuilder: (BuildContext context, int index) {
        var news = _newsList[index];
        return Padding(
          padding: const EdgeInsets.fromLTRB(8, 4, 8, 4),
          child: Card(
            child: Padding(
              padding: const EdgeInsets.all(4),
              child: ListTile(
                onTap: () {
                  Navigator.pushNamed(context, '/detail');
                },
                title: Text(
                  news.title,
                ),
                subtitle: Text(news.date ?? ''),
                leading: SizedBox(
                    width: 80,
                    height: 50,
                    child: Image.network(news.imageUrl, fit: BoxFit.fill)),
              ),
            ),
          ),
        );
      },
    );
  }
}
