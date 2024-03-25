import '../../../../core/resources/data_state.dart';
import '../../../../core/usecases/usecase.dart';
import '../repositories/product_repository.dart';

class GetAllCategoriesUseCase
    extends UseCase<RemoteDataState<List<String>>, void> {
  final ProductRepository _productRepository;

  GetAllCategoriesUseCase(this._productRepository);
  @override
  Future<RemoteDataState<List<String>>> call(void params) async {
    return await _productRepository.getAllCategories();
  }
}
