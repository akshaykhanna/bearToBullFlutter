import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:starter_flutter/product.dart';
import 'dart:convert';

import 'package:starter_flutter/product_list.dart';

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
      home: ProductList(),
    );
  }
}
