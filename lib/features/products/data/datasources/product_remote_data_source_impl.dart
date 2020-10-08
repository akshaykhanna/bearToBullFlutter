
import 'dart:convert';
import 'package:meta/meta.dart';
import 'package:starter_flutter/core/error/exceptions.dart';
import 'package:starter_flutter/core/http/http_client.dart';
import 'package:starter_flutter/features/products/data/datasources/product_remote_data_source.dart';
import 'package:starter_flutter/features/products/data/models/product_model.dart';

class ProductRemoteDataSourceImpl implements ProductRemoteDataSource {
  ProductRemoteDataSourceImpl({@required HttpClient httpClient})
      : assert(httpClient != null),
        _httpClient = httpClient;
  final HttpClient _httpClient;

  @override
  Future<List<ProductModel>> getProducts() async {
    final response = await _httpClient
        .get('http://www.mocky.io/v2/5e01d1cb2f00008000dcd310');

    if (response.statusCode < 200 || response.statusCode > 299) {
      throw APIException();
    }

    return productsFromJson(json.decode(response.body));
  }
}