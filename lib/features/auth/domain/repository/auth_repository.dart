import '../../../../core/resources/data_state.dart';
import '../entities/auth_entity.dart';
import '../usecases/login_usecase.dart';

abstract class AuthRepository {
  Future<RemoteDataState<AuthEntity>> login(LoginParams params);

  Future<void> logout();

  Future<LocalDataState<AuthEntity>> getAuth();
}
