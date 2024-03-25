import 'package:flutter/material.dart';

import '../../../core/resources/app_sizes.dart';

class SectionHeading extends StatelessWidget {
  const SectionHeading({
    super.key,
    required this.title,
  });
  final String title;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Text(
        title,
        style: const TextStyle(
          color: Colors.black,
          fontSize: AppSizes.s20,
          fontWeight: FontWeight.w900,
        ),
      ),
    );
  }
}
