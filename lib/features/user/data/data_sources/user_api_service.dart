import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:test_task_app/core/constants/constants.dart';
import 'package:test_task_app/features/user/data/models/user_model.dart';
part 'user_api_service.g.dart';

@RestApi(baseUrl: fakeStoreBaseURL)
abstract class UserApiService {
  factory UserApiService(Dio dio) = _UserApiService;
  @GET("/users/{id}")
  Future<HttpResponse<UserModel>> getUserById(@Path("id") String id);
  @PUT("/users/{id}")
  Future<HttpResponse<UserModel>> updateUser(
      @Query("id") String id, @Body() UserModel user);
  @DELETE("/users/{id}")
  Future<HttpResponse<UserModel>> deleteUser(@Query("id") String id);
}
