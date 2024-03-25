import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_task_app/features/product/domain/usecases/get_all_categories_usecase.dart';
import '../../../../../../core/resources/data_state.dart';
import 'remote_categories_event.dart';
import 'remote_categories_state.dart';

class RemoteCategoriesBloc
    extends Bloc<RemoteCategoriesEvent, RemoteCategoriesState> {
  final GetAllCategoriesUseCase _getAllCategoriesUseCase;
  RemoteCategoriesBloc(this._getAllCategoriesUseCase)
      : super(RemoteCategoriesLoading()) {
    on(onGetAllCategories);
  }

  Future<void> onGetAllCategories(
      GetAllCategoriesEvent event, Emitter emit) async {
    final dataState = await _getAllCategoriesUseCase(null);
    if (dataState is RemoteDataSuccess && dataState.data != null) {
      emit(RemoteCategoriesDone(dataState.data!));
    }
    if (dataState is RemoteDataFailure) {
      emit(RemoteCategoriesError(dataState.error!));
    }
  }
}
