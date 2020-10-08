
import 'package:flutter/material.dart';
import 'package:starter_flutter/features/products/domain/entities/product.dart';
import 'package:starter_flutter/features/products/presentation/pages/product_list_item_image_view.dart';

class ProductListItem extends StatefulWidget {
  const ProductListItem(
      {@required Product product})
      : assert(product != null),
        _product = product;

  final Product _product;

  static const keyName = 'Name';
  static const keyPrice = 'Price';
  static const keyQuantity = 'Quantity';
  static const keyRemove = 'Remove';
  static const keyAdd = 'Add';

  @override
  _ProductListItemState createState() => _ProductListItemState();
}

class _ProductListItemState extends State<ProductListItem> {

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 100,
        child: Column(children: <Widget>[
          const Divider(height: 5.0),
          ListTile(
            title: Text(
              '${widget._product.name}',
              key: const Key(ProductListItem.keyName),
              style: const TextStyle(
                fontSize: 17.0,
              ),
            ),
            subtitle: Padding(
                padding: const EdgeInsets.fromLTRB(0, 8.0, 0, 0),
                child: Text('${widget._product.price}',
                    key: const Key(ProductListItem.keyPrice),
                    style: const TextStyle(
                      fontSize: 12.0,
                      color: Colors.deepOrangeAccent,
                      fontStyle: FontStyle.italic,
                    ))),
            trailing: Row(mainAxisSize: MainAxisSize.min, children: <Widget>[
              IconButton(
                key: const Key(ProductListItem.keyRemove),
                icon: Icon(Icons.remove),
                onPressed: () => {},
              ),
              IconButton(
                  key: const Key(ProductListItem.keyAdd),
                  icon: Icon(Icons.add),
                  onPressed: () => {})
            ]),
            leading: Column(
              children: <Widget>[
                ProductListItemImageView(url: widget._product.imageUrl)
              ],
            ),
          )
        ]));
  }
}