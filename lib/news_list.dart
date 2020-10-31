import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:starter_flutter/news_drawer.dart';
import 'package:starter_flutter/news_list_bloc.dart';
import 'package:starter_flutter/news_list_state.dart';
import 'package:starter_flutter/sort-dropdown.dart';

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
      drawer: ProductDrawer(),
      appBar: AppBar(
        title: Text("Demo"),
        actions: [
          SortDropDown(
            onSortPressed: onSortPressed(),
          )
        ],
      ),
      body: BlocBuilder<NewsListBloc, NewsListState>(
          bloc: widget._bloc,
          builder: (BuildContext context, NewsListState productsListState) {
            if (productsListState is NewsListLoading) {
              return Center(
                child: CircularProgressIndicator(),
              );
            } else if (productsListState is NewsListLoaded) {
              return NewsListItems(products: productsListState.products);
            }

            return Container(
                color: Colors.white,
                height: double.infinity,
                width: double.infinity);
          }),
    );
  }
}
