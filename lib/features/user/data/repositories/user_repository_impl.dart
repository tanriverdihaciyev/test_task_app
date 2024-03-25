import 'dart:io';

import 'package:dio/dio.dart';
import 'package:test_task_app/core/resources/data_state.dart';
import 'package:test_task_app/features/user/data/data_sources/user_api_service.dart';
import 'package:test_task_app/features/user/data/models/user_model.dart';
import 'package:test_task_app/features/user/domain/entities/user_entity.dart';
import 'package:test_task_app/features/user/domain/repositories/user_repository.dart';

class UserRepositoryImpl implements UserRepository {
  final UserApiService _userApiService;

  UserRepositoryImpl(
    this._userApiService,
  );
  @override
  Future<RemoteDataState<UserEntity>> deleteUser(String id) async {
    try {
      final httpResponse = await _userApiService.deleteUser(id);
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
  Future<RemoteDataState<UserEntity>> getUserId(String id) async {
    try {
      final httpResponse = await _userApiService.getUserById(id);
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
  Future<RemoteDataState<UserEntity>> updateUser(UserEntity user) async {
    try {
      final httpResponse = await _userApiService.updateUser(
          user.id.toString(), UserModel.fromEntity(user));
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
