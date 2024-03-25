import 'package:equatable/equatable.dart';
import 'user_sub_entities.dart';

class UserEntity extends Equatable {
  final int id;
  final String email;
  final String username;
  final String password;
  final NameEntity name;
  final AddressEntity address;
  final String phone;

  const UserEntity(
      {required this.id,
      required this.email,
      required this.username,
      required this.password,
      required this.name,
      required this.address,
      required this.phone});

  @override
  List<Object> get props => [
        id,
        email,
        username,
        password,
        name,
        address,
        phone,
      ];
  UserEntity copyWith({
    int? id,
    String? email,
    String? username,
    String? password,
    String? phone,
    NameEntity? name,
    AddressEntity? address,
  }) {
    return UserEntity(
        id: id ?? this.id,
        email: email ?? this.email,
        username: username ?? this.username,
        password: password ?? this.password,
        name: this.name.copyWith(
              firstname: name?.firstname,
              lastname: name?.lastname,
            ),
        address: this.address.copyWith(
              city: address?.city,
              number: address?.number,
              street: address?.street,
              zipcode: address?.zipcode,
              geolocation: address?.geolocation.copyWith(
                lat: address.geolocation.lat,
                long: address.geolocation.long,
              ),
            ),
        phone: phone ?? this.phone);
  }
}
