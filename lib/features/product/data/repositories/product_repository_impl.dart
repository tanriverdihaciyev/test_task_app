import 'dart:io';

import 'package:dio/dio.dart';
import 'package:test_task_app/features/product/domain/usecases/get_products_in_category_usecase.dart';
import 'package:test_task_app/features/product/domain/usecases/get_products_usecase.dart';
import '../../../../core/resources/data_state.dart';
import '../data_sources/product_api_service.dart';
import '../../domain/entities/product_entity.dart';
import '../../domain/repositories/product_repository.dart';

class ProductRepositoryImpl implements ProductRepository {
  final ProductApiService _productApiService;

  ProductRepositoryImpl(this._productApiService);
  @override
  Future<RemoteDataState<List<ProductEntity>>> getProducts(
      GetProductsParams params) async {
    try {
      final httpResponse = await _productApiService.getProducts(
          limit: params.limit, page: params.page);
      if (httpResponse.response.statusCode == HttpStatus.ok) {
        return RemoteDataSuccess(httpResponse.data);
      } else {
        return RemoteDataFailure(
          DioException(
            error: httpResponse.response.statusMessage,
            response: httpResponse.response,
            type: DioExceptionType.badResponse,
            requestOptions: httpResponse.response.requestOptions,
          ),
        );
      }
    } on DioException catch (e) {
      return RemoteDataFailure(e);
    }
  }

  @override
  Future<RemoteDataState<List<String>>> getAllCategories() async {
    try {
      final httpResponse = await _productApiService.getAllCategories();
      if (httpResponse.response.statusCode == HttpStatus.ok) {
        return RemoteDataSuccess(httpResponse.data);
      } else {
        return RemoteDataFailure(
          DioException(
            error: httpResponse.response.statusMessage,
            response: httpResponse.response,
            type: DioExceptionType.badResponse,
            requestOptions: httpResponse.response.requestOptions,
          ),
        );
      }
    } on DioException catch (e) {
      return RemoteDataFailure(e);
    }
  }

  @override
  Future<RemoteDataState<List<ProductEntity>>> getProductsInCategory(
      GetProductsInCategoryParams params) async {
    try {
      final httpResponse = await _productApiService.getProductsInCategory(
        params.category,
        params.limit,
        params.page,
      );

      if (httpResponse.response.statusCode == HttpStatus.ok) {
        return RemoteDataSuccess(httpResponse.data);
      } else {
        return RemoteDataFailure(
          DioException(
            error: httpResponse.response.statusMessage,
            response: httpResponse.response,
            type: DioExceptionType.badResponse,
            requestOptions: httpResponse.response.requestOptions,
          ),
        );
      }
    } on DioException catch (e) {
      return RemoteDataFailure(e);
    }
  }
}
