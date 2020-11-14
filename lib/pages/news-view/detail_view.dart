import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import 'package:starter_flutter/actions/news_actions.dart';
import 'package:starter_flutter/models/app_state.dart';
import 'package:starter_flutter/models/news_state.dart';
import 'package:starter_flutter/pages/news-view/news_card.dart';
// import 'package:starter_flutter/pages/news-view/swiper_view.dart';

import '../../models/news.dart';

class DetailView extends StatelessWidget {
  void handleInitialBuild(NewsDetailScreenProps props, int id) {
    props.getNewsDetailList(id);
  }

  @override
  Widget build(BuildContext context) {
    final int id = ModalRoute.of(context).settings.arguments;
    return StoreConnector<AppState, NewsDetailScreenProps>(
      converter: (store) => mapStateToProps(store),
      onInitialBuild: (props) => this.handleInitialBuild(props, id),
      builder: (context, props) {
        News data = props.detailResponse.data;
        return Scaffold(
            appBar: AppBar(
              actions: [],
              title: Text("Detail View"),
              backgroundColor: Colors.orange,
            ),
            body: NewsCard(args: data));
        // body: SwipeCards(args.id));
      },
    );
  }
}

class NewsDetailScreenProps {
  final Function getNewsDetailList;
  final NewsDetailsState detailResponse;

  NewsDetailScreenProps({
    this.getNewsDetailList,
    this.detailResponse,
  });
}

NewsDetailScreenProps mapStateToProps(Store<AppState> store) {
  return NewsDetailScreenProps(
    detailResponse: store.state.news.details,
    getNewsDetailList: (int id) => store.dispatch(getNewsDetails(id)),
  );
}
