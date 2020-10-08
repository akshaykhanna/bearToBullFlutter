
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
    return Padding(
      padding: const EdgeInsets.fromLTRB(8, 4, 8, 4),
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(4),
          child: ListTile(
            title: Text(
              '${widget._product.name}',
              key: const Key(ProductListItem.keyName),
            ),
            subtitle: Text('${widget._product.price}',
                key: const Key(ProductListItem.keyPrice)),
            trailing: RaisedButton(onPressed: () {}, child: Text('Buy', style: TextStyle(color: Colors.white)), color: Colors.green),
            leading: ProductListItemImageView(url: widget._product.imageUrl),
          ),
        ),
      ),
    );
  }
}