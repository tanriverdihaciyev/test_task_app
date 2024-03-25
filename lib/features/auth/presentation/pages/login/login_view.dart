import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/resources/app_paddings.dart';
import '../../../../../core/resources/app_sizes.dart';
import '../../../../../core/resources/app_strings.dart';
import '../../../../../injection_container.dart';
import '../../states/auth/local/local_auth_bloc.dart';
import '../../states/auth/local/local_auth_event.dart';
import '../../states/auth/remote/remote_auth_bloc.dart';
import '../../states/auth/remote/remote_auth_state.dart';
import 'login_view_model.dart';

// username: "mor_2314",
// password: "83r5^_"
class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: BlocListener<RemoteAuthBloc, RemoteAuthState>(
      listener: (context, state) {
        if (state is RemoteAuthError) {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content: const Text(AppStrings.usernameOrPasswordError).tr()));
        }
        if (context.read<RemoteAuthBloc>().loading) {
          showDialog(
            context: context,
            builder: (context) => const Center(
              child: CircularProgressIndicator(),
            ),
          );
        }

        if (state is RemoteAuthDone) {
          sl<LocalAuthBloc>().add(const GetAuth());
        }
      },
      child: _builderBody(context),
    ));
  }

  _builderBody(BuildContext context) {
    final readVM = context.read<LoginViewModel>();
    final watchVM = context.watch<LoginViewModel>();
    return Container(
      padding: const EdgeInsets.only(top: AppPaddings.p100),
      child: SingleChildScrollView(
        child: Column(
          children: [
            const Center(
              child: FlutterLogo(
                size: AppSizes.s40,
              ),
            ),
            const SizedBox(
              height: AppSizes.s18,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: AppPaddings.p28),
              child: TextField(
                keyboardType: TextInputType.emailAddress,
                onTap: () => readVM.setUsername(watchVM.username ?? ""),
                onChanged: (value) => readVM.setUsername(value),
                decoration: InputDecoration(
                    hintText: AppStrings.username.tr(),
                    labelText: AppStrings.username.tr(),
                    error: watchVM.usernameValid
                        ? null
                        : const Text(AppStrings.usernameError).tr()),
              ),
            ),
            const SizedBox(
              height: AppSizes.s18,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: AppPaddings.p28),
              child: TextField(
                keyboardType: TextInputType.visiblePassword,
                onTap: () => readVM.setPassword(watchVM.password ?? ""),
                onChanged: (value) => readVM.setPassword(value),
                decoration: InputDecoration(
                    hintText: AppStrings.password.tr(),
                    labelText: AppStrings.password.tr(),
                    error: watchVM.passwordValid
                        ? null
                        : const Text(AppStrings.passwordError).tr()),
              ),
            ),
            const SizedBox(height: AppSizes.s28),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: AppPaddings.p28),
              child: SizedBox(
                width: double.infinity,
                height: AppSizes.s40,
                child: ElevatedButton(
                    onPressed: watchVM.allInputValid
                        ? () {
                            readVM.login();
                          }
                        : null,
                    child: const Text(AppStrings.login).tr()),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
