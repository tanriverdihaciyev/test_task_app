import 'package:dio/dio.dart';
import 'package:test_task_app/core/constants/constants.dart';

import 'package:retrofit/retrofit.dart';
import 'package:test_task_app/features/auth/data/models/auth_model.dart';

import '../../domain/usecases/login_usecase.dart';

part 'auth_api_service.g.dart';

@RestApi(baseUrl: fakeStoreBaseURL)
abstract class AuthApiService {
  factory AuthApiService(Dio dio) = _AuthApiService;

  @POST("/auth/login")
  Future<HttpResponse<AuthModel>> login(@Body() LoginParams params);
}
