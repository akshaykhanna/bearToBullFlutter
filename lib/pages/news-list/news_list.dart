import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:redux/redux.dart';
import 'package:starter_flutter/actions/news_actions.dart';
import 'package:starter_flutter/models/app_state.dart';
import 'package:starter_flutter/models/news_state.dart';
import 'package:starter_flutter/shared/news_drawer.dart';
import 'package:starter_flutter/bloc/news_list_bloc.dart';
import 'package:starter_flutter/pages/news-list/news_list_state.dart';
import 'package:starter_flutter/pages/news-list/sort-dropdown.dart';

import 'news_list_items.dart';

class NewsList extends StatefulWidget {
  const NewsList({@required NewsListBloc bloc})
      : assert(bloc != null),
        _bloc = bloc;

  final NewsListBloc _bloc;

  @override
  _NewsListState createState() => _NewsListState();
}

class _NewsListState extends State<NewsList> {
  String _sortValue = "A-Z";

  @override
  void initState() {
    super.initState();
  }

  onSortPressed() => (value) {
        _sortValue = value;
        widget._bloc.add(SortNews(value));
      };

  @override
  Widget build(BuildContext context) {
    widget._bloc.add(SortNews());
    return Scaffold(
      drawer: NewsDrawer(),
      appBar: AppBar(
        backgroundColor: Colors.orange,
        title: Text("Bear to bull"),
        actions: [
          SortDropDown(
            onSortPressed: onSortPressed(),
          )
        ],
      ),
      body: BlocBuilder<NewsListBloc, NewsListState>(
          bloc: widget._bloc,
          builder: (BuildContext context, NewsListState newsListState) {
            if (newsListState is NewsListLoading) {
              return Center(
                child: CircularProgressIndicator(),
              );
            } else if (newsListState is NewsListLoaded) {
              return NewsListItems(newsList: newsListState.newsList);
            }

            return Container(
                color: Colors.white,
                height: double.infinity,
                width: double.infinity);
          }),
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
