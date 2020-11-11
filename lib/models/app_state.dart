import 'package:meta/meta.dart';

import 'package:starter_flutter/models/news_state.dart';

@immutable
class AppState {
  final NewsState news;

  AppState({
    this.news,
  });

  factory AppState.initial() => AppState(
        news: NewsState.initial(),
      );

  AppState copyWith({
    NewsState news,
  }) {
    return AppState(
      news: news ?? this.news,
    );
  }
}
