import '../../../../domain/usecases/login_usecase.dart';

abstract class RemoteAuthEvent {
  const RemoteAuthEvent();
}

class Login extends RemoteAuthEvent {
  final LoginParams params;

  Login({required this.params});
}
