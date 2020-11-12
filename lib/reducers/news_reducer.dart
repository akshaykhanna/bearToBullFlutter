import 'dart:convert';

import 'package:redux_api_middleware/redux_api_middleware.dart';

import 'package:starter_flutter/actions/news_actions.dart';
import 'package:starter_flutter/models/news.dart';
import 'package:starter_flutter/models/news_state.dart';

NewsState newsReducer(NewsState state, FSA action) {
  NewsState newState = state;

  switch (action.type) {
    case LIST_NEWS_REQUEST:
      newState.list.error = null;
      newState.list.loading = true;
      newState.list.data = null;
      return newState;

    case LIST_NEWS_SUCCESS:
      newState.list.error = null;
      newState.list.loading = false;
      newState.list.data = newsListFromJSONStr(action.payload);
      return newState;

    case LIST_NEWS_SUCCESS:
      newState.list.error = action.payload;
      newState.list.loading = false;
      newState.list.data = null;
      return newState;

    case GET_NEWS_DETAILS_REQUEST:
      newState.details.error = null;
      newState.details.loading = true;
      newState.details.data = null;
      return newState;

    case GET_NEWS_DETAILS_SUCCESS:
      newState.details.error = null;
      newState.details.loading = false;
      // newState.details.data = userFromJSONStr(action.payload);
      return newState;

    case GET_NEWS_DETAILS_FAILURE:
      newState.details.error = action.payload;
      newState.details.loading = false;
      newState.details.data = null;
      return newState;

    default:
      return newState;
  }
}

List<News> newsListFromJSONStr(dynamic payload) {
  var jsonBody = jsonDecode(payload);
  var newsList = newsfromJson(jsonBody);
  newsList.sort((a, b) => a.id > b.id ? -1 : 1);
  return newsList;
}

// News userFromJSONStr(dynamic payload) {
//   return UserDetails.fromJSON(json.decode(payload));
// }
