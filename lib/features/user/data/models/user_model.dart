import 'user_sub_models.dart';
import '../../domain/entities/user_entity.dart';

class UserModel extends UserEntity {
  const UserModel(
      {required super.id,
      required super.email,
      required super.username,
      required super.password,
      required super.phone,
      required super.name,
      required super.address});

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      address: AddressModel.fromJson(json['address']),
      id: json['id'],
      email: json['email'],
      username: json['username'],
      password: json['password'],
      name: NameModel.fromJson(json['name']),
      phone: json['phone'],
    );
  }
  factory UserModel.fromEntity(UserEntity userEntity) {
    return UserModel(
      id: userEntity.id,
      email: userEntity.email,
      username: userEntity.username,
      password: userEntity.password,
      phone: userEntity.phone,
      name: NameModel.fromEntity(userEntity.name),
      address: AddressModel.fromEntity(userEntity.address),
    );
  }

  Map<String, dynamic> toJson() => {
        'address': AddressModel.fromEntity(address).toJson(),
        'email': email,
        'username': username,
        'password': password,
        'name': NameModel.fromEntity(name).toJson(),
        'phone': phone,
      };
}
