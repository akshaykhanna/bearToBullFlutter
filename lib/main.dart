import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import 'package:redux_api_middleware/redux_api_middleware.dart';
import 'package:redux_thunk/redux_thunk.dart';
import 'package:starter_flutter/logger.dart';
import 'package:starter_flutter/models/app_state.dart';
import 'package:starter_flutter/pages/news-view/detail_view.dart';

import 'package:starter_flutter/pages/news-list/news_list.dart';
import 'package:starter_flutter/reducers/app_reducer.dart';
import 'package:starter_flutter/routes.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final store = Store<AppState>(
    appReducer,
    initialState: AppState.initial(),
    middleware: [thunkMiddleware, apiMiddleware, loggingMiddleware],
  );

  @override
  Widget build(BuildContext context) {
    return StoreProvider(
        store: this.store,
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            primarySwatch: Colors.indigo,
            backgroundColor: Colors.orange,
            visualDensity: VisualDensity.adaptivePlatformDensity,
          ),
          initialRoute: '/',
          routes: {
            AppRoutes.newsList: (context) => NewsList(),
            AppRoutes.newsDetails: (context) => DetailView(),
          },
        ));
  }
}
