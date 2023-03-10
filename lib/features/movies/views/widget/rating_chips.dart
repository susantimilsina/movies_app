import 'package:flutter/material.dart';
import 'package:movies_app/core/configs/styles/app_colors.dart';
import 'package:movies_app/core/widgets/half_filled_icon.dart';

/// Customized Rating Bar used in App
class RatingChips extends StatelessWidget {
  /// Instance of [RatingChips]
  const RatingChips({required this.rating, super.key});

  /// Rating points
  final double rating;

  @override
  Widget build(BuildContext context) {
    return Wrap(
      crossAxisAlignment: WrapCrossAlignment.center,
      spacing: 3,
      runSpacing: 6,
      children: [
        HalfFilledIcon(
          icon: Icons.star_rounded,
          size: 30,
          color: Colors.red,
          percentage: rating / 10,
        ),
        Text(
          rating.toString(),
          style: Theme.of(context)
              .textTheme
              .bodySmall
              ?.copyWith(color: AppColors.primary),
        ),
        const Icon(
          Icons.arrow_forward_ios_outlined,
          size: 14,
          color: AppColors.primary,
        )
      ],
    );
  }
}
