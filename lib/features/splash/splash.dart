import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_task_app/features/home/pages/home_view.dart';

import '../auth/presentation/pages/login/login_view.dart';
import '../auth/presentation/states/auth/local/local_auth_bloc.dart';
import '../auth/presentation/states/auth/local/local_auth_state.dart';

class Splash extends StatelessWidget {
  const Splash({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LocalAuthBloc, LocalAuthState>(
      builder: (_, state) {
        if (state is LocalAuthError) {
          return const LoginView();
        }
        if (state is LocalAuthDone) {
          return const HomeView();
        }
        return const Scaffold(
          body: Center(
            child: FlutterLogo(
              size: 50,
            ),
          ),
        );
      },
    );
  }
}
