import 'dart:io';

import 'package:dio/dio.dart';
import 'package:test_task_app/core/error/exceptions.dart';
import '../../../../core/app_prefs.dart';
import '../../../../core/resources/data_state.dart';
import '../../domain/usecases/login_usecase.dart';
import '../data_sources/auth_api_service.dart';
import '../models/auth_model.dart';
import '../../domain/repository/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthApiService _authApiService;
  final AppPrefs _appPrefs;
  AuthRepositoryImpl(this._authApiService, this._appPrefs);
  @override
  Future<RemoteDataState<AuthModel>> login(LoginParams params) async {
    try {
      final httpResponse = await _authApiService.login(params);
      if (httpResponse.response.statusCode == HttpStatus.ok) {
        await _appPrefs.setAuthToken(httpResponse.data.token);
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
  Future<void> logout() async {
    return _appPrefs.setAuthToken("");
  }

  @override
  Future<LocalDataState<AuthModel>> getAuth() async {
    final localToken = await _appPrefs.getAuthToken();
    if (localToken != "") {
      return LocalDataSuccess(AuthModel(token: localToken));
    } else {
      return LocalDataFailure(CachedException());
    }
  }
}
