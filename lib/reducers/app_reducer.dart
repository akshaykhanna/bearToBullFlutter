import 'package:starter_flutter/models/app_state.dart';
import 'package:starter_flutter/reducers/news_reducer.dart';

AppState appReducer(AppState state, action) {
  return AppState(
    news: newsReducer(state.news, action),
  );
}
