import 'package:meta/meta.dart';
import 'package:starter_flutter/features/products/domain/entities/product.dart';

List<ProductModel> productsFromJson(List<dynamic> jsonItem) =>
    List<ProductModel>.from(jsonItem.map((x) => ProductModel.fromJson(x)));

class ProductModel extends Product {
  const ProductModel(
      {@required String id,
      @required String name,
      @required String price,
      @required int commentsCount,
      @required String imageUrl})
      : super(
            id: id,
            name: name,
            price: price,
            commentsCount: commentsCount,
            imageUrl: imageUrl);

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
        id: json['upc'],
        name: json['name'],
        price: json['price'],
        commentsCount: json['commentsCount'],
        imageUrl: json['image']);
  }
}