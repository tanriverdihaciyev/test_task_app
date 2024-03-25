import 'package:test_task_app/core/resources/data_state.dart';
import 'package:test_task_app/core/usecases/usecase.dart';
import 'package:test_task_app/features/user/domain/entities/user_entity.dart';
import 'package:test_task_app/features/user/domain/repositories/user_repository.dart';

class UpdateUserUseCase
    extends UseCase<RemoteDataState<UserEntity>, UserEntity> {
  final UserRepository _userRepository;

  UpdateUserUseCase(this._userRepository);
  @override
  Future<RemoteDataState<UserEntity>> call(UserEntity params) async {
    return await _userRepository.updateUser(params);
  }
}
