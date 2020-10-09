import 'package:flutter/material.dart';
import 'package:starter_flutter/product.dart';

class ProductListItems extends StatelessWidget {
  const ProductListItems({
    Key key,
    @required List<Product> products,
  })  : _products = products,
        super(key: key);

  final List<Product> _products;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: _products.length,
      itemBuilder: (BuildContext context, int index) {
        var product = _products[index];
        return Padding(
          padding: const EdgeInsets.fromLTRB(8, 4, 8, 4),
          child: Card(
            child: Padding(
              padding: const EdgeInsets.all(4),
              child: ListTile(
                title: Text(
                  product.name,
                ),
                subtitle: Text(product.price),
                trailing: RaisedButton(
                    onPressed: () {},
                    child: Text('Buy', style: TextStyle(color: Colors.white)),
                    color: Colors.green),
                leading: SizedBox(
                    width: 40,
                    height: 40,
                    child: Image.network(product.image, fit: BoxFit.fill)),
              ),
            ),
          ),
        );
      },
    );
  }
}
