import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lazy_load_scrollview/lazy_load_scrollview.dart';
import 'package:test_task_app/core/app_prefs.dart';
import 'package:test_task_app/core/resources/app_sizes.dart';
import 'package:test_task_app/core/resources/language_manager.dart';
import 'package:test_task_app/features/product/presentation/states/categories/remote_categories_event.dart';
import 'package:test_task_app/features/product/presentation/states/products/remote/remote_products_event.dart';
import 'package:test_task_app/features/profile/pages/profile.dart';
import 'package:test_task_app/injection_container.dart';
import '../../product/presentation/widgets/categories_filter.dart';

import '../../../core/resources/app_paddings.dart';
import '../../../core/resources/app_strings.dart';
import '../../product/presentation/states/categories/remote_categories_bloc.dart';
import '../../product/presentation/states/categories/remote_categories_state.dart';
import '../../product/presentation/states/products/remote/remote_products_bloc.dart';
import '../../product/presentation/widgets/product_tile.dart';
import '../states/home_view_model.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  void initState() {
    super.initState();
    sl<RemoteCategoriesBloc>().add(GetAllCategoriesEvent());
    sl<RemoteProductsBloc>().add(GetProductsEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(AppStrings.home).tr(),
        actions: [
          IconButton(
            onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const Profile(),
                )),
            icon: const Icon(Icons.person),
          ),
          PopupMenuButton(
            child: const Text(AppStrings.language).tr(),
            itemBuilder: (context) => [
              PopupMenuItem(
                child: const Text("AZ"),
                onTap: () =>
                    sl<AppPrefs>().setLanguageChanged(LanguageType.AZERBAIJAN),
              ),
              PopupMenuItem(
                child: const Text("TR"),
                onTap: () =>
                    sl<AppPrefs>().setLanguageChanged(LanguageType.TURKISH),
              ),
              PopupMenuItem(
                child: const Text("US"),
                onTap: () =>
                    sl<AppPrefs>().setLanguageChanged(LanguageType.ENGLISH),
              ),
            ],
          ),
          const SizedBox(
            width: AppSizes.s12,
          )
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: AppPaddings.p8),
            child: BlocBuilder<RemoteCategoriesBloc, RemoteCategoriesState>(
              builder: (context, state) {
                if (state is RemoteCategoriesLoading) {
                  return const Align(
                    alignment: Alignment.topCenter,
                    child: CircularProgressIndicator(),
                  );
                }
                if (state is RemoteCategoriesError) {
                  return Align(
                    alignment: Alignment.topCenter,
                    child: IconButton(
                      icon: const Icon(Icons.replay_outlined),
                      onPressed: () => context.read<HomeViewModel>().fetch(),
                    ),
                  );
                }
                if (state is RemoteCategoriesDone) {
                  return CategoriesFilterWidget(categories: state.categories!);
                }
                return const SizedBox();
              },
            ),
          ),
          Expanded(
            child: context.watch<RemoteProductsBloc>().productsIsNotEmpty
                ? LazyLoadScrollView(
                    scrollOffset: 70,
                    child: ListView.builder(
                      itemCount: context
                          .watch<RemoteProductsBloc>()
                          .productsList
                          .length,
                      itemBuilder: (context, index) {
                        return ProductWidget(
                          product: context
                              .watch<RemoteProductsBloc>()
                              .productsList[index],
                        );
                      },
                    ),
                    onEndOfPage: () => context.read<HomeViewModel>().fetch(),
                  )
                : context.watch<RemoteProductsBloc>().errorIsNotEmpty
                    ? Center(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(context
                                .watch<RemoteProductsBloc>()
                                .error!
                                .message!),
                            const SizedBox(
                              height: AppSizes.s5,
                            ),
                            IconButton(
                                icon: const Icon(Icons.replay_outlined),
                                onPressed: () =>
                                    context.read<HomeViewModel>().fetch()),
                          ],
                        ),
                      )
                    : const Center(
                        child: CircularProgressIndicator(),
                      ),
          ),
        ],
      ),
    );
  }
}
