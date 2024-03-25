import 'package:flutter/material.dart';
import 'package:test_task_app/injection_container.dart';
import '../../states/auth/remote/remote_auth_bloc.dart';
import '../../states/auth/remote/remote_auth_event.dart';
import '../../../domain/usecases/login_usecase.dart';

class LoginViewModel extends ChangeNotifier {
  String? _username;
  String? _password;
  String? get username => _username;
  String? get password => _password;
  setUsername(String username) {
    _username = username;
    notifyListeners();
  }

  setPassword(String password) {
    _password = password;
    notifyListeners();
  }

  bool get usernameValid => _username != "";
  bool get passwordValid => _password != "";

  bool get allInputValid =>
      usernameValid && _username != null && passwordValid && _password != null;

  login() {
    sl<RemoteAuthBloc>().add(
      Login(
        params: LoginParams(username: _username!, password: password!),
      ),
    );
  }
}
