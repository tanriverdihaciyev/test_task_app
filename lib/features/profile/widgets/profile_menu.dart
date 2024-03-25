import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../../core/resources/app_paddings.dart';
import '../../../core/resources/app_sizes.dart';
import '../../../core/resources/app_strings.dart';

class ProfileMenu extends StatelessWidget {
  ProfileMenu({
    super.key,
    required this.title,
    required this.value,
    required this.onPressed,
    this.icon,
    this.isNumber = false,
  });
  final bool isNumber;
  final String title;
  final dynamic value;
  final Function(dynamic value) onPressed;
  final IconData? icon;
  final TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: TextStyle(color: Colors.grey.shade900, fontSize: AppSizes.s16),
        ).tr(),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              value.toString(),
              style: const TextStyle(
                color: Colors.black,
                fontSize: AppSizes.s20,
                fontWeight: FontWeight.w900,
              ),
            ),
            IconButton(
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (context) => Dialog(
                      child: Container(
                        width: AppSizes.s400,
                        height: AppSizes.s200,
                        padding: const EdgeInsets.symmetric(
                            horizontal: AppPaddings.p14,
                            vertical: AppPaddings.p7),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            TextField(
                              controller: controller,
                              keyboardType:
                                  isNumber ? TextInputType.number : null,
                              decoration: InputDecoration(
                                hintText: title,
                                labelText: title,
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                TextButton(
                                  onPressed: () => Navigator.pop(context),
                                  child: const Text(AppStrings.cancel).tr(),
                                ),
                                TextButton(
                                  onPressed: () {
                                    onPressed(isNumber
                                        ? int.parse(controller.text)
                                        : controller.text);

                                    Navigator.pop(context);
                                  },
                                  child: const Text(AppStrings.ok).tr(),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  );
                },
                icon: Icon(icon ?? Icons.chevron_right)),
          ],
        )
      ],
    );
  }
}
