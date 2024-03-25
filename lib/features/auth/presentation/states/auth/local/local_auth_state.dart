import 'package:equatable/equatable.dart';

import '../../../../domain/entities/auth_entity.dart';

abstract class LocalAuthState extends Equatable {
  final AuthEntity? auth;

  const LocalAuthState({
    this.auth,
  });

  @override
  List<Object?> get props => [
        auth,
      ];
}

class LocalAuthLoading extends LocalAuthState {
  const LocalAuthLoading();
}

class LocalAuthDone extends LocalAuthState {
  const LocalAuthDone(AuthEntity auth) : super(auth: auth);
}

class LocalAuthError extends LocalAuthState {
  const LocalAuthError() : super();
}
