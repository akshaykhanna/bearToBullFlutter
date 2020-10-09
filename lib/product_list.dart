import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:starter_flutter/product.dart';
import 'package:http/http.dart' as http;
import 'package:starter_flutter/product_drawer.dart';
import 'package:starter_flutter/product_list_items.dart';

class ProductList extends StatefulWidget {
  @override
  _ProductListState createState() => _ProductListState();
}

class _ProductListState extends State<ProductList> {
  Future<List<Product>> getItems() async {
    var response = await http
        .get('https://run.mocky.io/v3/86714065-50f3-423b-a048-ee58c46733ea');
    var jsonBody = jsonDecode(response.body);
    return productsFromJson(jsonBody);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: ProductDrawer(),
      appBar: AppBar(
        title: Text('Flutter Workshop'),
      ),
      body: FutureBuilder(
          future: getItems(),
          builder: (context, snapshot) {
            switch (snapshot.connectionState) {
              case ConnectionState.none:
                return Text("None");
              case ConnectionState.waiting:
                return Center(
                  child: CircularProgressIndicator(),
                );
              case ConnectionState.active:
                return Text("Success");
              case ConnectionState.done:
                return ProductListItems(products: snapshot.data);
              default:
                return Text("Uknown failure");
                break;
            }
          }),
    );
  }
}
