
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

class Product extends Equatable {
  const Product(
      {@required this.id,
      @required this.name,
      @required this.price,
      @required this.commentsCount,
      @required this.imageUrl});

  final String id;
  final String name;
  final String price;
  final int commentsCount;
  final String imageUrl;

  @override
  List<Object> get props => [id];
}