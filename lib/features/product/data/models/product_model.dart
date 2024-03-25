import 'package:test_task_app/features/product/data/models/rating_model.dart';

import '../../domain/entities/product_entity.dart';

class ProductModel extends ProductEntity {
  const ProductModel(
      {required super.id,
      required super.title,
      required super.price,
      required super.description,
      required super.category,
      required super.image,
      required super.rating});

  factory ProductModel.fromJson(Map<String, dynamic> map) {
    return ProductModel(
      id: map["id"],
      title: map["title"],
      price: map["price"],
      description: map["description"],
      category: map["category"],
      image: map["image"],
      rating: RatingModel.fromJson(map["rating"]),
    );
  }
}
