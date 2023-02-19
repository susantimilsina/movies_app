import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movies_app/core/configs/styles/spacing_size.dart';
import 'package:movies_app/core/models/paginated_response.dart';
import 'package:movies_app/core/widgets/error_view.dart';
import 'package:movies_app/core/widgets/grid_shimmer.dart';
import 'package:movies_app/core/widgets/list_item_shimmer.dart';
import 'package:movies_app/core/widgets/list_shimmer.dart';
import 'package:movies_app/core/widgets/sub_heading_text.dart';
import 'package:movies_app/features/movies/models/movie_model.dart';
import 'package:movies_app/features/movies/providers/paginated_now_playing_provider.dart';
import 'package:movies_app/features/movies/providers/paginated_popular_movie_provider.dart';
import 'package:movies_app/features/movies/providers/paginated_toprated_movie_provider.dart';
import 'package:movies_app/features/movies/views/widget/movie_list.dart';

/// Movie Home Page ie First Page of Bottom bar
class MovieHomePage extends ConsumerWidget {
  /// Instance of [MovieHomePage]
  const MovieHomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final _nowPlayingMovieProvider =
        ref.watch(paginatedNowPlayingMovieProvider(1));
    final _popularMovieProvider = ref.watch(paginatedPopularMovieProvider(1));
    final _topratedMovieProvider = ref.watch(paginatedTopratedMovieProvider(1));
    return Padding(
      padding: const EdgeInsets.all(8),
      child: SingleChildScrollView(
        child: Column(
          children: [
            SubHeadingText(
              title: 'Now Playing',
              onTap: () {},
            ),
            _nowPlayingMovieProvider.when(
              data: (PaginatedResponse<MovieModel> data) {
                return MovieList(
                  movieList: data.results,
                );
              },
              error: (Object error, StackTrace? stackTrace) {
                log('Error fetching now playing movie');
                log(error.toString());
                return const ErrorView();
              },
              loading: () => const ListShimmer(),
            ),
            Spacing.sizedBoxH_12(),
            SubHeadingText(
              title: 'Popular',
              onTap: () {},
            ),
            _popularMovieProvider.when(
              data: (PaginatedResponse<MovieModel> data) {
                return MovieList(
                  movieList: data.results,
                );
              },
              error: (Object error, StackTrace? stackTrace) {
                log('Error fetching now playing movie');
                log(error.toString());
                return const ErrorView();
              },
              loading: () => const ListShimmer(),
            ),
            Spacing.sizedBoxH_12(),
            SubHeadingText(
              title: 'Top Rated',
              onTap: () {},
            ),
            _topratedMovieProvider.when(
              data: (PaginatedResponse<MovieModel> data) {
                return MovieList(
                  movieList: data.results,
                );
              },
              error: (Object error, StackTrace? stackTrace) {
                log('Error fetching now playing movie');
                log(error.toString());
                return const ErrorView();
              },
              loading: () => const ListShimmer(),
            ),
          ],
        ),
      ),
    );
  }
}
