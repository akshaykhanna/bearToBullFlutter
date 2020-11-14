import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:starter_flutter/pages/news-view/news_card.dart';
// import 'package:starter_flutter/pages/news-view/swiper_view.dart';

import '../../models/news.dart';

class DetailView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final News args = ModalRoute.of(context).settings.arguments;
    return Scaffold(
        appBar: AppBar(
          actions: [],
          title: Text("Detail View"),
          backgroundColor: Colors.orange,
        ),
        body: NewsCard(args: args));
    // body: SwipeCards(args.id));
  }
}
