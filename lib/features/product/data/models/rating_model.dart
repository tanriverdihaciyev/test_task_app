import '../../domain/entities/rating_entity.dart';

class RatingModel extends RatingEntity {
  const RatingModel({required super.rate, required super.count});

  factory RatingModel.fromJson(Map<String, dynamic> map) {
    return RatingModel(
      rate: map["rate"],
      count: map["count"],
    );
  }
}
