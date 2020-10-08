import 'package:dartz/dartz.dart';
import 'package:starter_flutter/core/error/error.dart';
import 'package:starter_flutter/core/error/exceptions.dart';
import 'package:starter_flutter/features/products/data/datasources/product_remote_data_source.dart';
import 'package:starter_flutter/features/products/domain/entities/product.dart';
import 'package:starter_flutter/features/products/domain/repositories/product_repository.dart';
import 'package:flutter/material.dart';

class ProductRepositoryImpl implements ProductRepository {
  ProductRepositoryImpl(
      {@required ProductRemoteDataSource remoteDataSource})
      : assert(remoteDataSource != null),
        _remoteDataSource = remoteDataSource;

  final ProductRemoteDataSource _remoteDataSource;

  @override
  Future<Either<Failure, List<Product>>> getProducts() async {
    try {
      final products = await _remoteDataSource.getProducts();
      return Right(products);
    } on APIException {
      return Left(APIFailure(message: 'Api Error'));
    }
  }
}