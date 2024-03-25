part of 'remote_user_bloc.dart';

sealed class RemoteUserEvent extends Equatable {
  const RemoteUserEvent();

  @override
  List<Object> get props => [];
}

final class GetUserEvent extends RemoteUserEvent {
  final String id;

  const GetUserEvent({required this.id});
}

final class UpdateUserEvent extends RemoteUserEvent {
  final UserEntity user;

  const UpdateUserEvent({required this.user});
}

final class DeleteUserEvent extends RemoteUserEvent {
  final String id;

  const DeleteUserEvent({required this.id});
}
