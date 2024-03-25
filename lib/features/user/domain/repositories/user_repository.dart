import 'package:test_task_app/core/resources/data_state.dart';
import 'package:test_task_app/features/user/domain/entities/user_entity.dart';

abstract class UserRepository {
  Future<RemoteDataState<UserEntity>> getUserId(String id);
  Future<RemoteDataState<UserEntity>> updateUser(UserEntity user);
  Future<RemoteDataState<UserEntity>> deleteUser(String id);
}
