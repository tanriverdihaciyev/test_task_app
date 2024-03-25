import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'features/user/data/data_sources/user_api_service.dart';
import 'features/user/data/repositories/user_repository_impl.dart';
import 'features/user/domain/repositories/user_repository.dart';
import 'features/user/domain/usecases/delete_user_usecase.dart';
import 'features/user/domain/usecases/get_user_usecase.dart';
import 'features/user/domain/usecases/update_user_usecase.dart';
import 'features/user/presentation/states/user/remote/bloc/remote_user_bloc.dart';

import 'core/app_prefs.dart';
import 'features/auth/data/data_sources/auth_api_service.dart';
import 'features/auth/data/repository/auth_repository_impl.dart';
import 'features/auth/domain/repository/auth_repository.dart';
import 'features/auth/domain/usecases/get_auth_usecase.dart';
import 'features/auth/domain/usecases/login_usecase.dart';
import 'features/auth/domain/usecases/logout_usecase.dart';
import 'features/auth/presentation/states/auth/local/local_auth_bloc.dart';
import 'features/auth/presentation/states/auth/remote/remote_auth_bloc.dart';
import 'features/product/data/data_sources/product_api_service.dart';
import 'features/product/data/repositories/product_repository_impl.dart';
import 'features/product/domain/repositories/product_repository.dart';
import 'features/product/domain/usecases/get_all_categories_usecase.dart';
import 'features/product/domain/usecases/get_products_in_category_usecase.dart';
import 'features/product/domain/usecases/get_products_usecase.dart';
import 'features/product/presentation/states/categories/remote_categories_bloc.dart';
import 'features/product/presentation/states/products/remote/remote_products_bloc.dart';

final sl = GetIt.instance;

Future<void> initializeDependencies() async {
  final sharedPrefs = await SharedPreferences.getInstance();

  sl.registerLazySingleton<SharedPreferences>(() => sharedPrefs);

  sl.registerLazySingleton(() => AppPrefs(sl()));

  sl.registerSingleton<Dio>(Dio());

  // auth
  sl.registerSingleton<AuthApiService>(AuthApiService(sl()));

  sl.registerSingleton<AuthRepository>(AuthRepositoryImpl(sl(), sl()));

  sl.registerSingleton<LoginUseCase>(LoginUseCase(sl()));

  sl.registerSingleton<LogOutUseCase>(LogOutUseCase(sl()));

  sl.registerSingleton<GetAuthUseCase>(GetAuthUseCase(sl()));

  sl.registerSingleton<RemoteAuthBloc>(RemoteAuthBloc(sl()));

  sl.registerSingleton<LocalAuthBloc>(LocalAuthBloc(sl(), sl()));

  // products

  sl.registerSingleton<ProductApiService>(ProductApiService(sl()));

  sl.registerSingleton<ProductRepository>(ProductRepositoryImpl(sl()));

  sl.registerSingleton<GetProductsUseCase>(GetProductsUseCase(sl()));

  sl.registerSingleton<GetProductsInCategoryUseCase>(
      GetProductsInCategoryUseCase(sl()));

  sl.registerSingleton<GetAllCategoriesUseCase>(GetAllCategoriesUseCase(sl()));

  sl.registerSingleton<RemoteProductsBloc>(RemoteProductsBloc(sl(), sl()));

  sl.registerSingleton<RemoteCategoriesBloc>(RemoteCategoriesBloc(sl()));

  // user

  sl.registerSingleton<UserApiService>(UserApiService(sl()));

  sl.registerSingleton<UserRepository>(UserRepositoryImpl(sl()));

  sl.registerSingleton<GetUserUseCase>(GetUserUseCase(sl()));

  sl.registerSingleton<UpdateUserUseCase>(UpdateUserUseCase(sl()));

  sl.registerSingleton<DeleteUserUseCase>(DeleteUserUseCase(sl()));

  sl.registerSingleton<RemoteUserBloc>(RemoteUserBloc(sl(), sl(), sl()));
}
