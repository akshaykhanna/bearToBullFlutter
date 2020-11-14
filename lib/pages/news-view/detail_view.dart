import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:redux/redux.dart';
import 'package:starter_flutter/actions/news_actions.dart';
import 'package:starter_flutter/models/app_state.dart';
import 'package:starter_flutter/models/news_state.dart';
import 'package:starter_flutter/pages/news-view/news_card.dart';
// import 'package:starter_flutter/pages/news-view/swiper_view.dart';

import '../../models/news.dart';

class DetailView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final News args = ModalRoute.of(context).settings.arguments;
    return Scaffold(
        appBar: AppBar(
          actions: [],
          title: Text("Detail View"),
          backgroundColor: Colors.orange,
        ),
        body: NewsCard(args: args));
    // body: SwipeCards(args.id));
  }
}

class NewsListScreenProps {
  final Function getNewsDetailList;
  // final Function getUserDetails;
  final NewsDetailsState detailResponse;

  NewsListScreenProps({
    this.getNewsDetailList,
    this.detailResponse,
    // this.getUserDetails,
  });
}

NewsListScreenProps mapStateToProps(Store<AppState> store) {
  return NewsListScreenProps(
    detailResponse: store.state.news.details,
    getNewsDetailList: (int id) => store.dispatch(getNewsDetails(id)),
    // getUserDetails: (int id) => store.dispatch(getUserDetails(id)),
  );
}
