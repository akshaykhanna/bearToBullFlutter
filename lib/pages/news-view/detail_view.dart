import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../model/news.dart';

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
      body: Card(
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
