import 'package:starter_flutter/model/news.dart';

abstract class NewsListState {}

class NewsListInitial extends NewsListState {}

class NewsListLoading extends NewsListState {}

class NewsListLoaded extends NewsListState {
  NewsListLoaded(this.newsList);
  final List<News> newsList;
}

class SortNews {
  SortNews([this.sortValue]);
  final String sortValue;
}
