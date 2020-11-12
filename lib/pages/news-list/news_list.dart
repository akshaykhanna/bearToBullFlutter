import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import 'package:starter_flutter/actions/news_actions.dart';
import 'package:starter_flutter/models/app_state.dart';
import 'package:starter_flutter/models/news.dart';
import 'package:starter_flutter/models/news_state.dart';

import 'news_list_items.dart';

class NewsList extends StatelessWidget {
  void handleInitialBuild(NewsListScreenProps props) {
    props.getNewsList();
  }

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, NewsListScreenProps>(
      converter: (store) => mapStateToProps(store),
      onInitialBuild: (props) => this.handleInitialBuild(props),
      builder: (context, props) {
        List<News> data = props.listResponse.data;
        bool loading = props.listResponse.loading;

        Widget body;
        if (loading) {
          body = Center(
            child: CircularProgressIndicator(),
          );
        } else {
          body = NewsListItems(newsList: data);
        }

        return Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.orange,
            title: Text("Bear to bull"),
          ),
          body: body,
        );
      },
    );
  }
}

class NewsListScreenProps {
  final Function getNewsList;
  // final Function getUserDetails;
  final ListNewsState listResponse;

  NewsListScreenProps({
    this.getNewsList,
    this.listResponse,
    // this.getUserDetails,
  });
}

NewsListScreenProps mapStateToProps(Store<AppState> store) {
  return NewsListScreenProps(
    listResponse: store.state.news.list,
    getNewsList: () => store.dispatch(getNewsList()),
    // getUserDetails: (int id) => store.dispatch(getUserDetails(id)),
  );
}
