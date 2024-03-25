import 'package:equatable/equatable.dart';

class NameEntity extends Equatable {
  final String firstname;
  final String lastname;

  const NameEntity({required this.firstname, required this.lastname});

  @override
  List<Object> get props => [firstname, lastname];

  NameEntity copyWith({String? firstname, String? lastname}) {
    return NameEntity(
      firstname: firstname ?? this.firstname,
      lastname: lastname ?? this.lastname,
    );
  }
}

class AddressEntity extends Equatable {
  final String city;
  final String street;
  final int number;
  final String zipcode;
  final GeolocationEntity geolocation;

  const AddressEntity(
      {required this.city,
      required this.street,
      required this.number,
      required this.zipcode,
      required this.geolocation});

  @override
  List<Object> get props => [
        city,
        street,
        number,
        zipcode,
        geolocation,
      ];
  AddressEntity copyWith(
      {String? city,
      String? street,
      String? zipcode,
      int? number,
      GeolocationEntity? geolocation}) {
    return AddressEntity(
      city: city ?? this.city,
      street: street ?? this.street,
      number: number ?? this.number,
      zipcode: zipcode ?? this.zipcode,
      geolocation: this
          .geolocation
          .copyWith(lat: geolocation?.lat, long: geolocation?.long),
    );
  }
}

class GeolocationEntity extends Equatable {
  final String lat;
  final String long;

  const GeolocationEntity({
    required this.lat,
    required this.long,
  });

  @override
  List<Object> get props => [
        lat,
        long,
      ];
  GeolocationEntity copyWith({String? lat, String? long}) {
    return GeolocationEntity(
      lat: lat ?? this.lat,
      long: long ?? this.long,
    );
  }
}
