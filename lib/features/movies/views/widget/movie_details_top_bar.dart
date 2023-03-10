import 'package:flutter/material.dart';
import 'package:movies_app/features/movies/views/widget/outlined_chip.dart';
import 'package:movies_app/features/movies/views/widget/rating_chips.dart';

/// Movie Detail page Top Bar Having Chips
class MovieDetailsTopBar extends StatelessWidget {
  /// Instance of [MovieDetailsTopBar]
  const MovieDetailsTopBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 10,
      runSpacing: 6,
      crossAxisAlignment: WrapCrossAlignment.center,
      children: [
        const RatingChips(
          rating: 5.1,
        ),
        Text(
          '2022',
          style: Theme.of(context)
              .textTheme
              .bodyMedium
              ?.copyWith(fontWeight: FontWeight.w600),
        ),
        const OutlinedChip(
          label: '13+',
        ),
        const OutlinedChip(
          label: 'United States',
        ),
        const OutlinedChip(
          label: 'Subtitle',
        ),
      ],
    );
  }
}
