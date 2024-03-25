import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';

import '../../../../domain/entities/auth_entity.dart';

abstract class RemoteAuthState extends Equatable {
  final AuthEntity? auth;
  final DioException? error;

  const RemoteAuthState({this.auth, this.error});

  @override
  List<Object?> get props => [
        auth,
        error,
      ];
}

class RemoteAuthLoading extends RemoteAuthState {
  const RemoteAuthLoading();
}

class RemoteAuthDone extends RemoteAuthState {
  const RemoteAuthDone(AuthEntity auth) : super(auth: auth);
}

class RemoteAuthError extends RemoteAuthState {
  const RemoteAuthError(DioException error) : super(error: error);
}
