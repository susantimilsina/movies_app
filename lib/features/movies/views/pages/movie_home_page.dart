import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movies_app/core/configs/styles/spacing_size.dart';
import 'package:movies_app/core/models/paginated_response.dart';
import 'package:movies_app/core/widgets/error_view.dart';
import 'package:movies_app/core/widgets/list_shimmer.dart';
import 'package:movies_app/features/movies/enums/movie_page.dart';
import 'package:movies_app/features/movies/models/movie_model.dart';
import 'package:movies_app/features/movies/providers/movie_provider.dart';
import 'package:movies_app/features/movies/views/widget/movie_heading_text.dart';
import 'package:movies_app/features/movies/views/widget/movie_list.dart';

/// Movie Home Page ie First Page of Bottom bar
class MovieHomePage extends ConsumerWidget {
  /// Instance of [MovieHomePage]
  const MovieHomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final nowPlayingMovieProvider =
        ref.watch(paginatedNowPlayingMovieProvider(0));
    final popularMovieProvider = ref.watch(paginatedPopularMovieProvider(0));
    final topratedMovieProvider = ref.watch(paginatedTopratedMovieProvider(0));
    return Padding(
      padding: const EdgeInsets.all(8),
      child: SingleChildScrollView(
        child: Column(
          children: [
            const MovieHeadingText(
              moviePage: MoviePage.nowPlaying,
            ),
            nowPlayingMovieProvider.when(
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
            const MovieHeadingText(
              moviePage: MoviePage.popular,
            ),
            popularMovieProvider.when(
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
            const MovieHeadingText(
              moviePage: MoviePage.topRated,
            ),
            topratedMovieProvider.when(
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
