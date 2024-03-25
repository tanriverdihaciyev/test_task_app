import 'package:test_task_app/core/resources/data_state.dart';
import 'package:test_task_app/core/usecases/usecase.dart';
import 'package:test_task_app/features/user/domain/entities/user_entity.dart';
import 'package:test_task_app/features/user/domain/repositories/user_repository.dart';

class GetUserUseCase extends UseCase<RemoteDataState<UserEntity>, String> {
  final UserRepository _userRepository;

  GetUserUseCase(this._userRepository);
  @override
  Future<RemoteDataState<UserEntity>> call(String params) async {
    return await _userRepository.getUserId(params);
  }
}
