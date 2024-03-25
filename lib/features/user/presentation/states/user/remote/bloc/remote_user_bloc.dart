import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:test_task_app/core/resources/data_state.dart';
import 'package:test_task_app/features/user/domain/entities/user_entity.dart';
import 'package:test_task_app/features/user/domain/usecases/delete_user_usecase.dart';
import 'package:test_task_app/features/user/domain/usecases/get_user_usecase.dart';
import 'package:test_task_app/features/user/domain/usecases/update_user_usecase.dart';

part 'remote_user_event.dart';
part 'remote_user_state.dart';

class RemoteUserBloc extends Bloc<RemoteUserEvent, RemoteUserState> {
  final GetUserUseCase _getUserUseCase;
  final UpdateUserUseCase _updateUserUseCase;
  final DeleteUserUseCase _deleteUserUseCase;
  RemoteUserBloc(
      this._getUserUseCase, this._updateUserUseCase, this._deleteUserUseCase)
      : super(RemoteUserInitial()) {
    on(onGetUser);
    on(onUpdateUser);
    on(onDeleteUser);
  }
  UserEntity? user;
  DioException? error;
  bool get userNotEmpty => user != null;
  bool get errotNotEmpty => error != null;
  bool loading = false;
  bool isUpdated = false;

  onGetUser(GetUserEvent event, Emitter<RemoteUserState> emit) async {
    if (!loading) {
      emit(RemoteUserInitial());
      isUpdated = false;
      loading = true;
      final dataState = await _getUserUseCase(event.id);
      if (dataState is RemoteDataSuccess && dataState.data != null) {
        user = dataState.data;
        emit(RemoteUserDone(user!));
      }
      if (dataState is RemoteDataFailure) {
        error = dataState.error;
        emit(RemoteUserFailure(error!));
      }
      loading = false;
    }
  }

  onUpdateUser(UpdateUserEvent event, Emitter<RemoteUserState> emit) async {
    if (isUpdated) {
      if (!loading) {
        loading = true;
        final dataState = await _updateUserUseCase(event.user);
        if (dataState is RemoteDataSuccess && dataState.data != null) {
          user = dataState.data;
          emit(RemoteUserDone(user!));
        }
        if (dataState is RemoteDataFailure) {
          error = dataState.error;
          emit(RemoteUserFailure(error!));
        }
        loading = false;
      }
    } else {
      emit(RemoteUserDone(event.user));
    }
  }

  onDeleteUser(DeleteUserEvent event, Emitter<RemoteUserState> emit) async {
    if (!loading) {
      loading = true;
      final dataState = await _deleteUserUseCase(event.id);
      if (dataState is RemoteDataSuccess && dataState.data != null) {
        user = dataState.data;
        emit(RemoteUserDone(user!));
      }
      if (dataState is RemoteDataFailure) {
        error = dataState.error;
        emit(RemoteUserFailure(error!));
      }
      loading = false;
    }
  }
}
