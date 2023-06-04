import 'package:flutter/material.dart';
import 'package:movies_app/features/movies/models/genre.dart';

/// Movie Detail page Genre Section
class GenreSection extends StatelessWidget {
  /// Instance of [GenreSection]
  const GenreSection({
    required this.genres,
    super.key,
  });

  /// List of Genres to display
  final List<Genre>? genres;

  @override
  Widget build(BuildContext context) {
    final genreText = (genres ?? []).map((c) => c.name).toList().join(', ');
    return Wrap(
      runSpacing: 6,
      crossAxisAlignment: WrapCrossAlignment.center,
      children: [
        Text(
          'Genre: ',
          style: Theme.of(context)
              .textTheme
              .bodyMedium
              ?.copyWith(fontWeight: FontWeight.w500),
        ),
        Text(
          genreText,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: Theme.of(context)
              .textTheme
              .bodyMedium
              ?.copyWith(fontWeight: FontWeight.w500),
        ),
      ],
    );
  }
}
