import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:test_task_app/core/app_prefs.dart';

import '../features/auth/presentation/pages/login/login_view_model.dart';
import '../features/auth/presentation/states/auth/local/local_auth_bloc.dart';
import '../features/auth/presentation/states/auth/local/local_auth_event.dart';
import '../features/auth/presentation/states/auth/remote/remote_auth_bloc.dart';
import '../features/home/states/home_view_model.dart';
import '../features/product/presentation/states/categories/remote_categories_bloc.dart';
import '../features/product/presentation/states/products/remote/remote_products_bloc.dart';
import '../features/splash/splash.dart';
import '../features/user/presentation/states/user/remote/bloc/remote_user_bloc.dart';
import '../injection_container.dart';

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final AppPrefs _appPrefs = sl<AppPrefs>();

  @override
  void didChangeDependencies() {
    _appPrefs.getLocal().then((value) {
      context.setLocale(value);
    });
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        BlocProvider<LocalAuthBloc>(
          create: (context) => sl()..add(const GetAuth()),
        ),
        BlocProvider<RemoteAuthBloc>(
          create: (context) => sl(),
        ),
        BlocProvider<RemoteProductsBloc>(
          create: (context) => sl(),
        ),
        BlocProvider<RemoteCategoriesBloc>(
          create: (context) => sl(),
        ),
        BlocProvider<RemoteUserBloc>(
          create: (context) => sl(),
        ),
        ChangeNotifierProvider(
          create: (context) => LoginViewModel(),
        ),
        ChangeNotifierProvider(
          create: (context) => HomeViewModel(),
        ),
      ],
      child: MaterialApp(
        localizationsDelegates: context.localizationDelegates,
        supportedLocales: context.supportedLocales,
        locale: context.locale,
        debugShowCheckedModeBanner: false,
        title: 'Test Task App',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const Splash(),
      ),
    );
  }
}
