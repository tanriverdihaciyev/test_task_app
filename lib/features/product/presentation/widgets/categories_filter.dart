import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/resources/app_sizes.dart';
import '../../../home/states/home_view_model.dart';

class CategoriesFilterWidget extends StatelessWidget {
  const CategoriesFilterWidget({super.key, required this.categories});
  final List<String> categories;

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: categories
          .map((e) => Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const SizedBox(
                    width: AppSizes.s5,
                  ),
                  FilterChip(
                    label: Text(e),
                    onSelected: (value) {
                      context.read<HomeViewModel>().setCurrentCategory(e);
                    },
                    selected: context.watch<HomeViewModel>().isSelected(e),
                  ),
                ],
              ))
          .toList(),
    );
  }
}
