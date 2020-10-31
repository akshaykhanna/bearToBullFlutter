import 'dart:convert';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:starter_flutter/product.dart';
import 'package:starter_flutter/news_list_state.dart';
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

  Future<List<Product>> _getItems([var _sortValue]) async {
    String url = 'https://run.mocky.io/v3/e43bce1b-1288-4c6b-ae5c-aaaf97ba5916';
    switch (_sortValue) {
      case "Z-A":
        url = 'https://run.mocky.io/v3/8ad03d4e-2c5c-48dd-a436-fe6412cf919e';
        break;
      case "Price":
        url = 'https://run.mocky.io/v3/c533f50f-b670-47cc-9bed-146865706cf4';
        break;
      default:
        break;
    }
    var response = await http.get(url);
    var jsonBody = jsonDecode(response.body);
    return productsFromJson(jsonBody);
  }
}