import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../models/news.dart';

class NewsCard extends StatelessWidget {
  const NewsCard({
    Key key,
    @required this.args,
  }) : super(key: key);

  final News args;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          Image.network(args.imageUrl, fit: BoxFit.fitWidth),
          Text(
            args.title,
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          Text(
            args.description,
            style: TextStyle(fontSize: 18),
          ),
        ],
      ),
    );
  }
}
