part of 'remote_user_bloc.dart';

sealed class RemoteUserState extends Equatable {
  const RemoteUserState({this.user, this.error});
  final UserEntity? user;
  final DioException? error;

  @override
  List<Object?> get props => [
        user,
        error,
      ];
}

final class RemoteUserInitial extends RemoteUserState {}

final class RemoteUserFailure extends RemoteUserState {
  const RemoteUserFailure(DioException error) : super(error: error);
}

final class RemoteUserDone extends RemoteUserState {
  const RemoteUserDone(UserEntity user) : super(user: user);
}
