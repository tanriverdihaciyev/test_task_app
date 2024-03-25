import '../../../../core/resources/data_state.dart';
import '../../../../core/usecases/usecase.dart';
import '../entities/product_entity.dart';
import '../repositories/product_repository.dart';

class GetProductsUseCase
    extends UseCase<RemoteDataState<List<ProductEntity>>, GetProductsParams> {
  final ProductRepository _productRepository;

  GetProductsUseCase(this._productRepository);
  @override
  Future<RemoteDataState<List<ProductEntity>>> call(
      GetProductsParams params) async {
    return await _productRepository.getProducts(params);
  }
}

class GetProductsParams {
  final int page;
  final int limit;

  GetProductsParams({this.page = 1, this.limit = 5});
}
