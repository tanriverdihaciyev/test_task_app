import '../../../../core/resources/data_state.dart';
import '../../../../core/usecases/usecase.dart';
import '../entities/auth_entity.dart';
import '../repository/auth_repository.dart';

class GetAuthUseCase implements UseCase<LocalDataState<AuthEntity>, void> {
  final AuthRepository _authRepository;

  GetAuthUseCase(this._authRepository);
  @override
  Future<LocalDataState<AuthEntity>> call(void params) async {
    return await _authRepository.getAuth();
  }
}
