import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DetailView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(actions: [], title: Text("Detail View")),
      body: Card(
        child: Column(
          children: [
            Text("Card View"),
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
