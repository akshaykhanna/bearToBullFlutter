import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;
import 'package:starter_flutter/core/http/http_client.dart';
import 'package:starter_flutter/core/http/http_client_impl.dart';
import 'package:starter_flutter/features/products/data/datasources/product_remote_data_source.dart';
import 'package:starter_flutter/features/products/data/datasources/product_remote_data_source_impl.dart';
import 'package:starter_flutter/features/products/data/repositories/product_repository_impl.dart';
import 'package:starter_flutter/features/products/domain/repositories/product_repository.dart';
import 'package:starter_flutter/features/products/presentation/bloc/product_list_bloc.dart';

GetIt serviceLocator;

void init(GetIt serviceLocator) {

  serviceLocator.registerFactory(
        () => ProductListBloc(repository: serviceLocator()),
  );

  serviceLocator.registerFactory<ProductRepository>(
          () => ProductRepositoryImpl(remoteDataSource: serviceLocator()));

  serviceLocator.registerFactory<ProductRemoteDataSource>(
          () => ProductRemoteDataSourceImpl(httpClient: serviceLocator()));

  serviceLocator.registerFactory<HttpClient>(
          () => HttpClientImpl(client: serviceLocator()));

  serviceLocator.registerFactory(() => http.Client());
}