import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:starter_flutter/features/products/presentation/bloc/product_list_bloc.dart';
import 'package:starter_flutter/features/products/presentation/pages/product_list_screen.dart';
import 'injection_container.dart' as di;

void main() {
  final serviceLocator = GetIt();
  di.init(serviceLocator);
  runApp(MyApp(serviceLocator));
}

class MyApp extends StatelessWidget {

  MyApp(GetIt serviceLocator) {
    di.serviceLocator = serviceLocator;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Deo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: ProductsListScreen(bloc: di.serviceLocator<ProductListBloc>()),
    );
  }
}
