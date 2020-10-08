
import 'package:starter_flutter/features/products/domain/entities/product.dart';

abstract class ProductListState {}

class ProductListInitial extends ProductListState {}

class ProductListLoading extends ProductListState {}

class ProductListLoaded extends ProductListState {
  ProductListLoaded(this.products);
  final List<Product> products;
}

class ProductListError extends ProductListState {
  ProductListError(this.message);
  final String message;
}