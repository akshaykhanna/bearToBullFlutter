import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:starter_flutter/product.dart';
import 'package:http/http.dart' as http;
import 'package:starter_flutter/product_drawer.dart';
import 'package:starter_flutter/sort-dropdown.dart';

import 'product.dart';
import 'product_list_items.dart';

class ProductList extends StatefulWidget {
  @override
  _ProductListState createState() => _ProductListState();
}

class _ProductListState extends State<ProductList> {
  // ignore: close_sinks
  final _streamController = StreamController<List<Product>>();

  String _sortValue = "A-Z";

  @override
  void initState() {
    _getItems();
    super.initState();
  }

  Future<void> _getItems() async {
    String url = 'https://run.mocky.io/v3/e43bce1b-1288-4c6b-ae5c-aaaf97ba5916';
    switch (_sortValue) {
      case "Z-A":
        url = 'https://run.mocky.io/v3/86714065-50f3-423b-a048-ee58c46733ea';
        break;
      case "Price":
        url = 'https://run.mocky.io/v3/86714065-50f3-423b-a048-ee58c46733ea';
        break;
      default:
        break;
    }
    var response = await http.get(url);
    var jsonBody = jsonDecode(response.body);
    _streamController.sink.add(productsFromJson(jsonBody));
  }

  onSortPressed() => (value) {
        _sortValue = value;
        _getItems();
      };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: ProductDrawer(),
      appBar: AppBar(
        title: SortDropDown(
          onSortPressed: onSortPressed(),
        ),
      ),
      body: StreamBuilder(
          stream: _streamController.stream,
          builder: (context, snapShot) {
            switch (snapShot.connectionState) {
              case ConnectionState.none:
                return Text("None");
              case ConnectionState.waiting:
                return Center(
                  child: CircularProgressIndicator(),
                );
              case ConnectionState.active:
                return ProductListItems(products: snapShot.data);
              default:
                return Text("Unknown failure");
                break;
            }
          }),
    );
  }

  @override
  void dispose() {
    _streamController.sink.close();
    super.dispose();
  }
}
