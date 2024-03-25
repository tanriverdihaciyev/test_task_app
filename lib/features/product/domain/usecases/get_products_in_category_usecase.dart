import '../../../../core/resources/data_state.dart';
import '../../../../core/usecases/usecase.dart';
import '../entities/product_entity.dart';
import '../repositories/product_repository.dart';

class GetProductsInCategoryUseCase extends UseCase<
    RemoteDataState<List<ProductEntity>>, GetProductsInCategoryParams> {
  final ProductRepository _productRepository;

  GetProductsInCategoryUseCase(this._productRepository);
  @override
  Future<RemoteDataState<List<ProductEntity>>> call(
      GetProductsInCategoryParams params) async {
    return await _productRepository.getProductsInCategory(params);
  }
}

class GetProductsInCategoryParams {
  final String category;
  final int page;
  final int limit;

  GetProductsInCategoryParams(
      {required this.category, required this.page, required this.limit});
}
