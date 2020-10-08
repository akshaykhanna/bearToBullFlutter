
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:starter_flutter/core/no_params.dart';
import 'package:starter_flutter/features/products/domain/repositories/product_repository.dart';
import 'package:starter_flutter/features/products/presentation/bloc/product_list_state.dart';

class ProductListBloc extends Bloc<NoParams, ProductListState> {
  ProductListBloc({
    @required ProductRepository repository,
  })  : assert(repository != null),
        _repository = repository;

  final ProductRepository _repository;

  @override
  ProductListState get initialState => ProductListInitial();

  @override
  Stream<ProductListState> mapEventToState(NoParams event) async* {
    yield ProductListLoading();
    final output = await _repository.getProducts();
    yield* output.fold((failure) async* {
      yield ProductListError('Something went wrong!');
    }, (products) async* {
      yield ProductListLoaded(products);
    });
  }
}