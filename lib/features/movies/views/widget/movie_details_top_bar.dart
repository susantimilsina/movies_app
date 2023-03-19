import 'package:flutter/material.dart';
import 'package:movies_app/core/extensions/date_extensions.dart';
import 'package:movies_app/core/extensions/int_extensions.dart';
import 'package:movies_app/features/movies/views/widget/outlined_chip.dart';
import 'package:movies_app/features/movies/views/widget/rating_chips.dart';

/// Movie Detail page Top Bar Having Chips
class MovieDetailsTopBar extends StatelessWidget {
  /// Instance of [MovieDetailsTopBar]
  const MovieDetailsTopBar({
    required this.voteAvg,
    required this.status,
    required this.runtime,
    required this.releaseDate,
    required this.adult,
    super.key,
  });

  /// Rating of movie
  final double? voteAvg;

  /// Release status of movie
  final String? status;

  /// Runtime in Minutes
  final int? runtime;

  /// Release date
  final DateTime? releaseDate;

  /// is movie 18+
  final bool? adult;

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 10,
      runSpacing: 6,
      crossAxisAlignment: WrapCrossAlignment.center,
      children: [
        RatingChips(
          rating: voteAvg ?? 0.0,
        ),
        Text(
          (releaseDate ?? DateTime.now()).longDate,
          style: Theme.of(context)
              .textTheme
              .bodyMedium
              ?.copyWith(fontWeight: FontWeight.w600),
        ),
        if (adult ?? false)
          const OutlinedChip(
            label: '18+',
          ),
        if (status != null)
          OutlinedChip(
            label: status ?? '',
          ),
        OutlinedChip(
          label: (runtime ?? 0).onMin,
        ),
      ],
    );
  }
}
