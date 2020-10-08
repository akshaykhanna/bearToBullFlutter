
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:starter_flutter/core/no_params.dart';
import 'package:starter_flutter/features/products/presentation/bloc/product_list_bloc.dart';
import 'package:starter_flutter/features/products/presentation/bloc/product_list_state.dart';
import 'package:starter_flutter/features/products/presentation/pages/product_list.dart';

class ProductsListScreen extends StatefulWidget {
  const ProductsListScreen({@required ProductListBloc bloc})
      : assert(bloc != null),
        _bloc = bloc;

  final ProductListBloc _bloc;

  @override
  _ProductsListScreenState createState() => _ProductsListScreenState();
}

class _ProductsListScreenState extends State<ProductsListScreen> {
  @override
  Widget build(BuildContext context) {
    widget._bloc.add(NoParams());
    return Scaffold(
      drawer: Drawer(
          child: ListView(
            children: <Widget>[
              UserAccountsDrawerHeader(
                decoration: BoxDecoration(color: Colors.indigo),
                accountName: Text("Flutter Workshop"),
                accountEmail: Text("flutter@thoughtworks.com"),
                currentAccountPicture: CircleAvatar(
                    backgroundColor: Colors.green,
                    child: Text('F', style: TextStyle(color: Colors.white))
                ),
              ),
              ListTile(
                  leading: Icon(Icons.home),
                  title: Text("Home"),
                  onTap: () {
                    Navigator.pop(context);
                  }),
              ListTile(
                  leading: Icon(Icons.share),
                  title: Text("Share"),
                  onTap: () {
                    Navigator.pop(context);
                  }),
              Divider(),
              ListTile(
                  leading: Icon(Icons.settings),
                  title: Text("Settings"),
                  onTap: () {
                    Navigator.pop(context);
                  }),
              ListTile(
                  leading: Icon(Icons.power_settings_new),
                  title: Text("Logout"),
                  onTap: () {
                    Navigator.pop(context);
                  }),
            ],
          )),
      appBar: AppBar(title: Text('Flutter Workshop'), backgroundColor: Colors.indigo,),
      body: BlocBuilder<ProductListBloc, ProductListState>(
          bloc: widget._bloc,
          builder: (BuildContext context, ProductListState productsListState) {
            if (productsListState is ProductListLoading) {
              return const Center(child: CircularProgressIndicator());
            } else if (productsListState is ProductListError) {
              return const Center(child: Text('Error!!!'));
            } else if (productsListState is ProductListLoaded) {
              return ProductList(
                  products: productsListState.products);
            }
            return Container(
                color: Colors.white,
                height: double.infinity,
                width: double.infinity);
          }),
    );
  }

  @override
  void dispose() {
    widget._bloc.close();
    super.dispose();
  }
}