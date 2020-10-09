import 'dart:convert';
import 'dart:html';

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
  String _sortValue = "A-Z";

  Future<List<Product>> _getItems() async {
    String url = 'https://run.mocky.io/v3/86714065-50f3-423b-a048-ee58c46733ea';
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
    return productsFromJson(jsonBody);
  }

  onSortPressed() => (value) {
        this.setState(() {
          _sortValue = value;
        });
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
      body: FutureBuilder(
        future: _getItems(),
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
              return Text("Unknown failure");
              break;
          }
        },
      ),
    );
  }
}

class SortDropDown extends StatefulWidget {
  const SortDropDown({
    @required FunctionStringCallback onSortPressed,
  }) : _onSortPressed = onSortPressed;

  final FunctionStringCallback _onSortPressed;

  @override
  _SortDropDownState createState() => _SortDropDownState();
}

class _SortDropDownState extends State<SortDropDown> {
  @override
  Widget build(BuildContext context) {
    return DropdownButton(items: [
      DropdownMenuItem(
        child: Text("A-Z"),
        value: "A-Z",
      ),
      DropdownMenuItem(
        child: Text("Z-A"),
        value: "Z-A",
      ),
      DropdownMenuItem(
        child: Text("Price"),
        value: "Price",
      )
    ], onChanged: widget._onSortPressed);
  }
}