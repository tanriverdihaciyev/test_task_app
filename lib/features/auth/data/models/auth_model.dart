import '../../domain/entities/auth_entity.dart';

class AuthModel extends AuthEntity {
  const AuthModel({required super.token});

  factory AuthModel.fromJson(Map<String, dynamic> map) {
    return AuthModel(token: map["token"]);
  }
}
