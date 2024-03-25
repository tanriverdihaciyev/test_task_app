import 'package:test_task_app/features/user/domain/entities/user_sub_entities.dart';

class AddressModel extends AddressEntity {
  const AddressModel(
      {required super.geolocation,
      required super.city,
      required super.street,
      required super.number,
      required super.zipcode});

  factory AddressModel.fromJson(Map<String, dynamic> json) {
    return AddressModel(
        city: json['city'],
        street: json['street'],
        number: json['number'],
        zipcode: json['zipcode'],
        geolocation: GeolocationModel.fromJson(json['geolocation']));
  }
  factory AddressModel.fromEntity(AddressEntity addressEntity) {
    return AddressModel(
        city: addressEntity.city,
        street: addressEntity.street,
        number: addressEntity.number,
        zipcode: addressEntity.zipcode,
        geolocation: GeolocationModel.fromEntity(addressEntity.geolocation));
  }

  Map<String, dynamic> toJson() => {
        'geolocation': GeolocationModel.fromEntity(geolocation).toJson(),
        'city': city,
        'street': street,
        'number': number,
        'zipcode': zipcode,
      };
}

class GeolocationModel extends GeolocationEntity {
  const GeolocationModel({required super.lat, required super.long});

  factory GeolocationModel.fromJson(Map<String, dynamic> json) {
    return GeolocationModel(lat: json['lat'], long: json['long']);
  }
  factory GeolocationModel.fromEntity(GeolocationEntity geolocationEntity) {
    return GeolocationModel(
        lat: geolocationEntity.lat, long: geolocationEntity.long);
  }

  Map<String, dynamic> toJson() => {'lat': lat, 'long': long};
}

class NameModel extends NameEntity {
  const NameModel({required super.firstname, required super.lastname});

  factory NameModel.fromJson(Map<String, dynamic> json) {
    return NameModel(firstname: json['firstname'], lastname: json['lastname']);
  }
  factory NameModel.fromEntity(NameEntity nameEntity) {
    return NameModel(
        firstname: nameEntity.firstname, lastname: nameEntity.lastname);
  }

  Map<String, dynamic> toJson() =>
      {'firstname': firstname, 'lastname': lastname};
}
