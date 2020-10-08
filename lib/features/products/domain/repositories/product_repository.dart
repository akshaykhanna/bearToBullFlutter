
import 'package:dartz/dartz.dart';
import 'package:starter_flutter/core/error/error.dart';
import 'package:starter_flutter/features/products/domain/entities/product.dart';

abstract class ProductRepository {
  Future<Either<Failure, List<Product>>> getProducts();
}