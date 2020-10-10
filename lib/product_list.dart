
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:starter_flutter/product_drawer.dart';
import 'package:starter_flutter/product_list_bloc.dart';
import 'package:starter_flutter/product_list_state.dart';
import 'package:starter_flutter/sort-dropdown.dart';

import 'product_list_items.dart';

class ProductList extends StatefulWidget {
  const ProductList({@required ProductListBloc bloc})
      : assert(bloc != null),
        _bloc = bloc;

  final ProductListBloc _bloc;

  @override
  _ProductListState createState() => _ProductListState();
}

class _ProductListState extends State<ProductList> {

  String _sortValue = "A-Z";

  @override
  void initState() {
    super.initState();
  }

  onSortPressed() => (value) {
        _sortValue = value;
        widget._bloc.add(SortProducts(value));
      };

  @override
  Widget build(BuildContext context) {
    widget._bloc.add(SortProducts());
    return Scaffold(
      drawer: ProductDrawer(),
      appBar: AppBar(
        title: Text("Demo"),
        actions: [ SortDropDown(
          onSortPressed: onSortPressed(),
        )],
      ),
      body: BlocBuilder<ProductListBloc, ProductListState>(
          bloc: widget._bloc,
          builder: (BuildContext context, ProductListState productsListState) {
            if (productsListState is ProductListLoading) {
              return Center(
                child: CircularProgressIndicator(),
              );
            } else if (productsListState is ProductListLoaded) {
              return ProductListItems(products: productsListState.products);
            }

            return Container(
                color: Colors.white,
                height: double.infinity,
                width: double.infinity);
          }),
    );
  }
}
