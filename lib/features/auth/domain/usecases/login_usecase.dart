import '../../../../core/resources/data_state.dart';
import '../../../../core/usecases/usecase.dart';
import '../entities/auth_entity.dart';
import '../repository/auth_repository.dart';

class LoginUseCase
    implements UseCase<RemoteDataState<AuthEntity>, LoginParams> {
  final AuthRepository _authRepository;

  LoginUseCase(this._authRepository);
  @override
  Future<RemoteDataState<AuthEntity>> call(LoginParams params) async {
    return await _authRepository.login(params);
  }
}

class LoginParams {
  final String username;
  final String password;

  LoginParams({required this.username, required this.password});

  Map<String, dynamic> toJson() => {
        "username": username,
        "password": password,
      };
}
