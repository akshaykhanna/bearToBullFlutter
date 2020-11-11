import 'dart:convert';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:starter_flutter/models/news.dart';
import 'package:starter_flutter/pages/news-list/news_list_state.dart';
import 'package:http/http.dart' as http;

class NewsListBloc extends Bloc<SortNews, NewsListState> {
  @override
  get initialState => NewsListInitial();

  @override
  Stream<NewsListState> mapEventToState(SortNews event) async* {
    yield NewsListLoading();
    final output = await _getItems(event.sortValue);
    yield NewsListLoaded(output);
  }

  Future<List<News>> _getItems([var _sortValue]) async {
    String url =
        'https://raw.githubusercontent.com/akshaykhanna/JSONData/master/news3.json';
    // switch (_sortValue) {
    //   case "Z-A":
    //     url = 'https://run.mocky.io/v3/8ad03d4e-2c5c-48dd-a436-fe6412cf919e';
    //     break;
    //   case "Price":
    //     url = 'https://run.mocky.io/v3/c533f50f-b670-47cc-9bed-146865706cf4';
    //     break;
    //   default:
    //     break;
    // }
    var response = await http.get(url);
    var jsonBody = jsonDecode(response.body);
    var newsList = newsfromJson(jsonBody);
    newsList.sort((a, b) => a.id > b.id ? -1 : 1);
    return newsList;
  }
}
