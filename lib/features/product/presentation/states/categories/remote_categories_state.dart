import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';

abstract class RemoteCategoriesState extends Equatable {
  final List<String>? categories;
  final DioException? error;

  const RemoteCategoriesState({this.categories, this.error});

  @override
  List<Object?> get props => [
        categories,
        error,
      ];
}

class RemoteCategoriesLoading extends RemoteCategoriesState {}

class RemoteCategoriesDone extends RemoteCategoriesState {
  const RemoteCategoriesDone(List<String> categories)
      : super(categories: categories);
}

class RemoteCategoriesError extends RemoteCategoriesState {
  const RemoteCategoriesError(DioException error) : super(error: error);
}
