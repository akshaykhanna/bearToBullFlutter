
import 'package:starter_flutter/product.dart';

abstract class ProductListState {}

class ProductListInitial extends ProductListState {}

class ProductListLoading extends ProductListState {}

class ProductListLoaded extends ProductListState {
  ProductListLoaded(this.products);
  final List<Product> products;
}

class SortProducts {
  SortProducts([this.sortValue]);
  final String sortValue;
}