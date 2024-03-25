import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../core/resources/data_state.dart';
import '../../../../domain/usecases/login_usecase.dart';
import 'remote_auth_event.dart';
import 'remote_auth_state.dart';

class RemoteAuthBloc extends Bloc<RemoteAuthEvent, RemoteAuthState> {
  final LoginUseCase _loginUseCase;
  RemoteAuthBloc(this._loginUseCase) : super(const RemoteAuthLoading()) {
    on(onLogin);
  }
  bool loading = false;

  Future<void> onLogin(Login event, Emitter<RemoteAuthState> emit) async {
    if (!loading) {
      loading = true;
      final dataState = await _loginUseCase(event.params);
      if (dataState is RemoteDataSuccess && dataState.data != null) {
        emit(RemoteAuthDone(dataState.data!));
      }
      if (dataState is RemoteDataFailure) {
        emit(RemoteAuthError(dataState.error!));
      }
      loading = false;
    }
  }
}
