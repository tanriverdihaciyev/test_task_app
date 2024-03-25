import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../core/resources/data_state.dart';
import '../../../../domain/usecases/get_auth_usecase.dart';
import '../../../../domain/usecases/logout_usecase.dart';
import 'local_auth_event.dart';
import 'local_auth_state.dart';

class LocalAuthBloc extends Bloc<LocalAuthEvent, LocalAuthState> {
  final LogOutUseCase _logOutUseCase;
  final GetAuthUseCase _getAuthUseCase;
  LocalAuthBloc(this._logOutUseCase, this._getAuthUseCase)
      : super(const LocalAuthLoading()) {
    on(onLogOut);
    on(onGetAuth);
  }

  Future<void> onLogOut(LogOut event, Emitter<LocalAuthState> emit) async {
    await _logOutUseCase(null);

    emit(const LocalAuthLoading());
  }

  Future<void> onGetAuth(GetAuth event, Emitter<LocalAuthState> emit) async {
    final dataState = await _getAuthUseCase(null);
    if (dataState is LocalDataSuccess) {
      emit(LocalAuthDone(dataState.data!));
    }
    if (dataState is LocalDataFailure) {
      emit(const LocalAuthError());
    }
  }
}
