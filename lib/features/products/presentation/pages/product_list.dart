
import 'package:flutter/material.dart';
import 'package:starter_flutter/features/products/domain/entities/product.dart';
import 'package:starter_flutter/features/products/presentation/pages/product_list_item.dart';

class ProductList extends StatelessWidget {
  const ProductList(
      {@required List<Product> products})
      : assert(products != null),
        _products = products;
  final List<Product> _products;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: _products.length,
      itemBuilder: (BuildContext context, int index) {
        return ProductListItem(
          product: _products[index]
          );
      },
    );
  }
}