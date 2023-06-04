import 'dart:developer';

import 'package:expandable_text/expandable_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movies_app/core/configs/styles/app_colors.dart';
import 'package:movies_app/core/configs/styles/spacing_size.dart';
import 'package:movies_app/core/widgets/app_loader.dart';
import 'package:movies_app/core/widgets/error_view.dart';
import 'package:movies_app/features/movies/providers/movie_detail_provider.dart';
import 'package:movies_app/features/movies/views/pages/movie_cast_page.dart';
import 'package:movies_app/features/movies/views/widget/genre_section.dart';
import 'package:movies_app/features/movies/views/widget/movie_details_top_bar.dart';

/// Custom Scroll View Description for Movie Details
class MovieDetailedDescription extends ConsumerWidget {
  /// Instance of  [MovieDetailedDescription]
  const MovieDetailedDescription({
    required this.movieId,
    super.key,
  });

  /// Movie id
  final int movieId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final movieAsync = ref.watch(movieDetailsProvider(movieId));

    return SliverToBoxAdapter(
      child: ConstrainedBox(
        constraints: BoxConstraints(
          minHeight: MediaQuery.of(context).size.height,
        ),
        child: DecoratedBox(
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(
                15,
              ),
              topRight: Radius.circular(
                15,
              ),
            ),
            color: Theme.of(context).colorScheme.background,
          ),
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: movieAsync.when(
              data: (movie) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    /// Top Chips Bar
                    MovieDetailsTopBar(
                      adult: movie.adult,
                      releaseDate: movie.releaseDate,
                      runtime: movie.runtime,
                      status: movie.status,
                      voteAvg: movie.voteAverage,
                    ),

                    Spacing.sizedBoxH_12(),

                    /// Genre Section
                    GenreSection(
                      genres: movie.genres,
                    ),
                    Spacing.sizedBoxH_08(),

                    /// Movie Description/Overview
                    ExpandableText(
                      movie.overview ?? '',
                      expandText: 'View more',
                      collapseText: 'View less',
                      maxLines: 3,
                      linkColor: AppColors.primary,
                    ),

                    MovieCastPage(
                      movieId: movieId,
                    )
                  ],
                );
              },
              error: (Object error, StackTrace? stackTrace) {
                log('Error fetching person details');
                log(error.toString());
                return const ErrorView();
              },
              loading: () {
                return const AppLoader();
              },
            ),
          ),
        ),
      ),
    );
  }
}
