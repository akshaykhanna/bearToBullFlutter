import 'package:starter_flutter/product.dart';

abstract class NewsListState {}

class NewsListInitial extends NewsListState {}

class NewsListLoading extends NewsListState {}

class NewsListLoaded extends NewsListState {
  NewsListLoaded(this.products);
  final List<Product> products;
}

class SortNews {
  SortNews([this.sortValue]);
  final String sortValue;
}
