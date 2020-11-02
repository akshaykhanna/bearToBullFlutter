import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'news.dart';

class DetailView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final News args = ModalRoute.of(context).settings.arguments;
    return Scaffold(
      appBar: AppBar(actions: [], title: Text("Detail View")),
      body: Card(
        child: Column(
          children: [
            Text(args.title),
            IconButton(
                icon: Icon(Icons.arrow_back),
                onPressed: () {
                  Navigator.pop(context);
                })
          ],
        ),
      ),
    );
  }
}
