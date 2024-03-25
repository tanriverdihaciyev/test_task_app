import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_task_app/features/auth/presentation/states/auth/local/local_auth_bloc.dart';
import 'package:test_task_app/features/auth/presentation/states/auth/local/local_auth_event.dart';
import '../../../core/resources/app_paddings.dart';
import '../../../core/resources/app_sizes.dart';
import '../../../core/resources/app_strings.dart';
import '../widgets/profile_menu.dart';
import '../widgets/section_heading.dart';
import '../../user/presentation/states/user/remote/bloc/remote_user_bloc.dart';
import '../../../injection_container.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  void initState() {
    super.initState();
    sl<RemoteUserBloc>().add(const GetUserEvent(id: "1"));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          AppStrings.profile,
          style: TextStyle(
            color: Colors.black,
            fontSize: AppSizes.s28,
            fontWeight: FontWeight.w900,
          ),
        ).tr(),
        actions: [
          IconButton(
            onPressed: () {
              sl<RemoteUserBloc>().add(const GetUserEvent(id: "1"));
            },
            icon: const Icon(Icons.close),
          ),
          IconButton(
            onPressed: () {
              sl<RemoteUserBloc>().isUpdated = true;
            },
            icon: const Icon(Icons.done),
          ),
          const SizedBox(
            width: AppSizes.s12,
          ),
        ],
      ),
      body: BlocBuilder<RemoteUserBloc, RemoteUserState>(
        builder: (context, state) {
          if (state is RemoteUserFailure) {
            return Center(
              child: TextButton(
                  onPressed: () =>
                      sl<RemoteUserBloc>().add(const GetUserEvent(id: "1")),
                  child: const Text("Reload")),
            );
          }
          if (state is RemoteUserDone) {
            return Container(
              padding: const EdgeInsets.only(
                right: AppPaddings.p14,
                left: AppPaddings.p14,
                bottom: AppPaddings.p7,
              ),
              width: double.infinity,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    ProfileMenu(
                      title: AppStrings.username.tr(),
                      value:
                          context.watch<RemoteUserBloc>().state.user!.username,
                      onPressed: (value) {
                        sl<RemoteUserBloc>().add(UpdateUserEvent(
                            user: context
                                .read<RemoteUserBloc>()
                                .user!
                                .copyWith(username: value)));
                      },
                    ),
                    ProfileMenu(
                      title: AppStrings.email.tr(),
                      value: state.user!.email,
                      onPressed: (value) => sl<RemoteUserBloc>().add(
                        UpdateUserEvent(
                          user: context
                              .read<RemoteUserBloc>()
                              .user!
                              .copyWith(email: value),
                        ),
                      ),
                    ),
                    ProfileMenu(
                      title: AppStrings.password.tr(),
                      value: state.user!.password,
                      onPressed: (value) => sl<RemoteUserBloc>().add(
                        UpdateUserEvent(
                          user: context
                              .read<RemoteUserBloc>()
                              .user!
                              .copyWith(password: value),
                        ),
                      ),
                    ),
                    ProfileMenu(
                      title: AppStrings.phone.tr(),
                      value: state.user!.phone,
                      onPressed: (value) => sl<RemoteUserBloc>().add(
                        UpdateUserEvent(
                          user: context
                              .read<RemoteUserBloc>()
                              .user!
                              .copyWith(phone: value),
                        ),
                      ),
                    ),
                    const Divider(),
                    SectionHeading(title: AppStrings.name.tr()),
                    ProfileMenu(
                      title: AppStrings.firstname,
                      value: state.user!.name.firstname,
                      onPressed: (value) => sl<RemoteUserBloc>().add(
                        UpdateUserEvent(
                          user: context.read<RemoteUserBloc>().user!.copyWith(
                                name: context
                                    .read<RemoteUserBloc>()
                                    .user!
                                    .name
                                    .copyWith(firstname: value),
                              ),
                        ),
                      ),
                    ),
                    ProfileMenu(
                      title: AppStrings.lastname,
                      value: state.user!.name.lastname,
                      onPressed: (value) => sl<RemoteUserBloc>().add(
                        UpdateUserEvent(
                          user: context.read<RemoteUserBloc>().user!.copyWith(
                                name: context
                                    .read<RemoteUserBloc>()
                                    .user!
                                    .name
                                    .copyWith(lastname: value),
                              ),
                        ),
                      ),
                    ),
                    const Divider(),
                    SectionHeading(title: AppStrings.address.tr()),
                    ProfileMenu(
                      title: AppStrings.city.tr(),
                      value: state.user!.address.city,
                      onPressed: (value) => sl<RemoteUserBloc>().add(
                        UpdateUserEvent(
                          user: context.read<RemoteUserBloc>().user!.copyWith(
                                address: context
                                    .read<RemoteUserBloc>()
                                    .user!
                                    .address
                                    .copyWith(city: value),
                              ),
                        ),
                      ),
                    ),
                    ProfileMenu(
                      title: AppStrings.street.tr(),
                      value: state.user!.address.street,
                      onPressed: (value) => sl<RemoteUserBloc>().add(
                        UpdateUserEvent(
                          user: context.read<RemoteUserBloc>().user!.copyWith(
                                address: context
                                    .read<RemoteUserBloc>()
                                    .user!
                                    .address
                                    .copyWith(street: value),
                              ),
                        ),
                      ),
                    ),
                    ProfileMenu(
                      title: AppStrings.number.tr(),
                      value: state.user!.address.number,
                      isNumber: true,
                      onPressed: (value) => sl<RemoteUserBloc>().add(
                        UpdateUserEvent(
                          user: context.read<RemoteUserBloc>().user!.copyWith(
                                address: context
                                    .read<RemoteUserBloc>()
                                    .user!
                                    .address
                                    .copyWith(number: value),
                              ),
                        ),
                      ),
                    ),
                    ProfileMenu(
                      title: AppStrings.zipcode.tr(),
                      value: state.user!.address.zipcode,
                      onPressed: (value) => sl<RemoteUserBloc>().add(
                        UpdateUserEvent(
                          user: context.read<RemoteUserBloc>().user!.copyWith(
                                address: context
                                    .read<RemoteUserBloc>()
                                    .user!
                                    .address
                                    .copyWith(zipcode: value),
                              ),
                        ),
                      ),
                    ),
                    const Divider(),
                    SectionHeading(title: AppStrings.geolocation.tr()),
                    ProfileMenu(
                      title: AppStrings.lat.tr(),
                      value: state.user!.address.geolocation.lat,
                      onPressed: (value) => sl<RemoteUserBloc>().add(
                        UpdateUserEvent(
                          user: context.read<RemoteUserBloc>().user!.copyWith(
                                address: context
                                    .read<RemoteUserBloc>()
                                    .user!
                                    .address
                                    .copyWith(
                                      geolocation: context
                                          .read<RemoteUserBloc>()
                                          .user!
                                          .address
                                          .geolocation
                                          .copyWith(lat: value),
                                    ),
                              ),
                        ),
                      ),
                    ),
                    ProfileMenu(
                      title: AppStrings.long.tr(),
                      value: state.user!.address.geolocation.long,
                      onPressed: (value) => sl<RemoteUserBloc>().add(
                        UpdateUserEvent(
                          user: context.read<RemoteUserBloc>().user!.copyWith(
                                address: context
                                    .read<RemoteUserBloc>()
                                    .user!
                                    .address
                                    .copyWith(
                                      geolocation: context
                                          .read<RemoteUserBloc>()
                                          .user!
                                          .address
                                          .geolocation
                                          .copyWith(lat: value),
                                    ),
                              ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          }

          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.logout),
        onPressed: () {
          sl<LocalAuthBloc>().add(const LogOut());
          sl<LocalAuthBloc>().add(const GetAuth());
          // sl<RemoteUserBloc>().add(const DeleteUserEvent(id: "1"));
          Navigator.pop(context);
        },
      ),
    );
  }
}
