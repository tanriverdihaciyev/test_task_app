import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../domain/entities/product_entity.dart';
import '../../../../domain/usecases/get_products_in_category_usecase.dart';
import '../../../../../../core/resources/data_state.dart';
import '../../../../domain/usecases/get_products_usecase.dart';
import 'remote_products_event.dart';
import 'remote_products_state.dart';

class RemoteProductsBloc
    extends Bloc<RemoteProductsEvent, RemoteProductsState> {
  final GetProductsUseCase _getProductsUseCase;
  final GetProductsInCategoryUseCase _getProductsInCategoryUseCase;
  RemoteProductsBloc(
      this._getProductsUseCase, this._getProductsInCategoryUseCase)
      : super(RemoteProductsLoading()) {
    on(onGetProducts);
    on(onGetProductsInCategory);
  }

  final List<ProductEntity> productsList = [];
  DioException? error;

  int _page = 0;
  final _limit = 5;
  bool loading = false;
  String? _currentCategory;

  bool get productsIsNotEmpty => productsList.isNotEmpty;
  bool get errorIsNotEmpty => error != null;

  Future<void> onGetProducts(GetProductsEvent event, Emitter emit) async {
    if (!loading) {
      loading = true;
      emit(RemoteProductsLoading());
      if (_currentCategory == null) {
        _page++;
      } else {
        _page = 1;
        productsList.clear();
        _currentCategory = null;
      }

      final dataState = await _getProductsUseCase(
        GetProductsParams(page: _page, limit: _limit),
      );

      if (dataState is RemoteDataSuccess && dataState.data != null) {
        productsList.addAll(dataState.data!);
        emit(RemoteProductsDone(dataState.data!));
      }
      if (dataState is RemoteDataFailure) {
        _page--;
        error = dataState.error!;
        emit(RemoteProductsError(error!));
      }
      loading = false;
    }
  }

  Future<void> onGetProductsInCategory(
      GetProductsInCategoryEvent event, Emitter emit) async {
    if (!loading) {
      loading = true;

      if (_currentCategory == event.category) {
        _page++;
      } else {
        _page = 1;

        _currentCategory = event.category;

        productsList.clear();
      }

      emit(RemoteProductsLoading());

      final dataState = await _getProductsInCategoryUseCase(
          GetProductsInCategoryParams(
              category: event.category, page: _page, limit: _limit));

      if (dataState is RemoteDataSuccess && dataState.data != null) {
        productsList.addAll(dataState.data!);
        emit(RemoteProductsDone(productsList));
      }

      if (dataState is RemoteDataFailure) {
        _page--;
        error = dataState.error!;
        emit(RemoteProductsError(error!));
      }

      loading = false;
    }
  }
}
