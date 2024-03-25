import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';

import '../../../../domain/entities/product_entity.dart';

abstract class RemoteProductsState extends Equatable {
  final List<ProductEntity>? products;
  final DioException? error;

  const RemoteProductsState({this.products, this.error});

  @override
  List<Object?> get props => [
        products,
        error,
      ];
}

class RemoteProductsLoading extends RemoteProductsState {}

class RemoteProductsDone extends RemoteProductsState {
  const RemoteProductsDone(List<ProductEntity> products)
      : super(products: products);
}

class RemoteProductsError extends RemoteProductsState {
  const RemoteProductsError(DioException error) : super(error: error);
}
