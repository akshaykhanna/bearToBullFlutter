import 'package:starter_flutter/models/news.dart';

class NewsState {
  ListNewsState list;
  NewsDetailsState details;

  NewsState({
    this.list,
    this.details,
  });

  factory NewsState.initial() => NewsState(
        list: ListNewsState.initial(),
        details: NewsDetailsState.initial(),
      );
}

class ListNewsState {
  dynamic error;
  bool loading;
  List<News> data;

  ListNewsState({
    this.error,
    this.loading,
    this.data,
  });

  factory ListNewsState.initial() => ListNewsState(
        error: null,
        loading: false,
        data: [],
      );
}

class NewsDetailsState {
  dynamic error;
  bool loading;
  News data;

  NewsDetailsState({
    this.error,
    this.loading,
    this.data,
  });

  factory NewsDetailsState.initial() => NewsDetailsState(
        error: null,
        loading: false,
        data: null,
      );
}
