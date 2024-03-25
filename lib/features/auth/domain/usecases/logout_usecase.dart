import '../../../../core/usecases/usecase.dart';
import '../repository/auth_repository.dart';

class LogOutUseCase implements UseCase<void, void> {
  final AuthRepository _authRepository;

  LogOutUseCase(this._authRepository);

  @override
  Future<void> call(void params) async {
    return _authRepository.logout();
  }
}
