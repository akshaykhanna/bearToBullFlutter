import 'package:flutter/material.dart';
import 'package:starter_flutter/detail_view.dart';

import 'package:starter_flutter/news_list.dart';
import 'package:starter_flutter/news_list_bloc.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.indigo,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => NewsList(bloc: NewsListBloc()),
        '/detail': (context) => DetailView(),
      },
    );
  }
}
