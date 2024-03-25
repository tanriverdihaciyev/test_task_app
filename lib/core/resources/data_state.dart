import 'package:dio/dio.dart';

abstract class DataState<T> {}

abstract class RemoteDataState<T> extends DataState<T> {
  final T? data;
  final DioException? error;

  RemoteDataState({this.data, this.error});
}

class RemoteDataSuccess<T> extends RemoteDataState<T> {
  RemoteDataSuccess(T data) : super(data: data);
}

class RemoteDataFailure<T> extends RemoteDataState<T> {
  RemoteDataFailure(DioException error) : super(error: error);
}

abstract class LocalDataState<T> extends DataState<T> {
  final T? data;
  final Exception? error;

  LocalDataState({this.error, this.data});
}

class LocalDataSuccess<T> extends LocalDataState<T> {
  LocalDataSuccess(T data) : super(data: data);
}

class LocalDataFailure<T> extends LocalDataState<T> {
  LocalDataFailure(Exception error) : super(error: error);
}
