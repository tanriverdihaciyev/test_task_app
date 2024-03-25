import 'package:test_task_app/features/product/domain/usecases/get_products_in_category_usecase.dart';
import 'package:test_task_app/features/product/domain/usecases/get_products_usecase.dart';

import '../../../../core/resources/data_state.dart';
import '../entities/product_entity.dart';

abstract class ProductRepository {
  Future<RemoteDataState<List<ProductEntity>>> getProducts(
      GetProductsParams params);

  Future<RemoteDataState<List<String>>> getAllCategories();

  Future<RemoteDataState<List<ProductEntity>>> getProductsInCategory(
      GetProductsInCategoryParams params);
}
