import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:test_task_app/core/constants/constants.dart';
import 'package:test_task_app/features/product/data/models/product_model.dart';

part 'product_api_service.g.dart';

@RestApi(baseUrl: fakeStoreBaseURL)
abstract class ProductApiService {
  factory ProductApiService(Dio dio) = _ProductApiService;
  @GET("/products")
  Future<HttpResponse<List<ProductModel>>> getProducts({
    @Query("limit") required int limit,
    @Query("page") required int page,
  });
  @GET("/products/categories")
  Future<HttpResponse<List<String>>> getAllCategories();

  @GET("/products/category/{categoryName}")
  Future<HttpResponse<List<ProductModel>>> getProductsInCategory(
    @Path("categoryName") String category,
    @Query("limit") int limit,
    @Query("page") int page,
  );
}
