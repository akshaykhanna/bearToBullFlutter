import 'package:redux/redux.dart';
import 'package:redux_thunk/redux_thunk.dart';
import 'package:redux_api_middleware/redux_api_middleware.dart';
import 'package:starter_flutter/common/config.dart';

import 'package:starter_flutter/models/app_state.dart';

const LIST_NEWS_REQUEST = 'LIST_NEWS_REQUEST';
const LIST_NEWS_SUCCESS = 'LIST_NEWS_SUCCESS';
const LIST_NEWS_FAILURE = 'LIST_NEWS_FAILURE';

RSAA getNewsListRequest() {
  return RSAA(
    method: 'GET',
    endpoint: apiURL,
    types: [
      LIST_NEWS_REQUEST,
      LIST_NEWS_SUCCESS,
      LIST_NEWS_FAILURE,
    ],
    headers: {
      'Content-Type': 'application/json',
    },
  );
}

ThunkAction<AppState> getNewsList() =>
    (Store<AppState> store) => store.dispatch(getNewsListRequest());

const GET_NEWS_DETAILS_REQUEST = 'GET_NEWS_DETAILS_REQUEST';
const GET_NEWS_DETAILS_SUCCESS = 'GET_NEWS_DETAILS_SUCCESS';
const GET_NEWS_DETAILS_FAILURE = 'GET_NEWS_DETAILS_FAILURE';

RSAA getNewsDetailsRequest(int id) {
  return RSAA(
    method: 'GET',
    endpoint: 'http://jsonplaceholder.typicode.com/users/$id',
    types: [
      GET_NEWS_DETAILS_REQUEST,
      GET_NEWS_DETAILS_SUCCESS,
      GET_NEWS_DETAILS_FAILURE,
    ],
    headers: {
      'Content-Type': 'application/json',
    },
  );
}

ThunkAction<AppState> getNewsDetails(int id) =>
    (Store<AppState> store) => store.dispatch(getNewsDetailsRequest(id));
