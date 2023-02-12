// ignore_for_file: inference_failure_on_function_return_type

import 'package:flutter/material.dart';
import 'package:movies_app/core/configs/styles/app_colors.dart';

/// Sub Heading Text for HomePage
class SubHeadingText extends StatelessWidget {
  ///Instance of [SubHeadingText]
  const SubHeadingText({
    required this.title,
    required this.onTap,
    super.key,
  });

  /// Title for the widget
  final String title;

  /// Tap click function
  final Function() onTap;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: Theme.of(context).textTheme.headlineMedium,
        ),
        InkWell(
          onTap: onTap,
          child: Padding(
            padding: const EdgeInsets.all(8),
            child: Row(
              children: [
                Text(
                  'See More',
                  style: Theme.of(context)
                      .textTheme
                      .bodyMedium
                      ?.copyWith(color: AppColors.primary),
                ),
                const Icon(Icons.arrow_forward_ios, color: AppColors.primary)
              ],
            ),
          ),
        ),
      ],
    );
  }
}
