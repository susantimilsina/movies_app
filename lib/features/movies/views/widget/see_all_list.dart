import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movies_app/core/widgets/error_view.dart';
import 'package:movies_app/core/widgets/list_item_shimmer.dart';
import 'package:movies_app/features/movies/enums/movie_page.dart';
import 'package:movies_app/features/movies/providers/current_movie_provider.dart';
import 'package:movies_app/features/movies/providers/movie_list_scroll_controller.dart';
import 'package:movies_app/features/movies/providers/movie_provider.dart';
import 'package:movies_app/features/movies/providers/see_all_movie_provider.dart';
import 'package:movies_app/features/movies/providers/see_all_page_provider.dart';
import 'package:movies_app/features/movies/views/widget/movie_card.dart';

/// See App Movie list of See All Movie Page
class SeeAllMovieList extends ConsumerWidget {
  /// Instance of [SeeAllMovieList]
  const SeeAllMovieList({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final movieCount = ref.watch(countProvider);
    final scrollController = ref.watch(movieScrollControllerProvider);
    final seeAllPageStatus = ref.watch(seeAllPageStatusProvider);

    return movieCount.when(
      loading: () => const ListItemShimmer(),
      data: (int count) {
        return GridView.builder(
          controller: scrollController,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            // maxCrossAxisExtent: 200,
            childAspectRatio: 3 / 2,
            crossAxisSpacing: 20,
            mainAxisSpacing: 20, crossAxisCount: 4,
          ),
          itemCount: count,
          itemBuilder: (BuildContext ctx, index) {
            final currentMovieIndex = ref
                .watch(
                  seeAllPageStatus == MoviePage.nowPlaying
                      ? paginatedNowPlayingMovieProvider(index)
                      : seeAllPageStatus == MoviePage.topRated
                          ? paginatedTopratedMovieProvider(index)
                          : paginatedPopularMovieProvider(index),
                )
                .whenData((pageData) => pageData.results[index % 20]);

            return ProviderScope(
              overrides: [
                currentMovieProvider.overrideWithValue(currentMovieIndex)
              ],
              child: const MovieCard(),
            );
          },
        );
        // return ListView.builder(
        //   controller: scrollController,
        //   itemCount: count,
        //   itemExtent: 110,
        //   itemBuilder: (context, index) {
        //     final currentMovieIndex = ref
        //         .watch(
        //           seeAllPageStatus == MoviePage.nowPlaying
        //               ? paginatedNowPlayingMovieProvider(index)
        //               : seeAllPageStatus == MoviePage.topRated
        //                   ? paginatedTopratedMovieProvider(index)
        //                   : paginatedPopularMovieProvider(index),
        //         )
        //         .whenData((pageData) => pageData.results[index % 20]);

        //     return ProviderScope(
        //       overrides: [
        //         currentMovieProvider.overrideWithValue(currentMovieIndex)
        //       ],
        //       child: const MovieCard(),
        //     );
        //   },
        // );
      },
      error: (Object error, StackTrace? stackTrace) {
        log('Error fetching movie List');
        log(error.toString());
        log(stackTrace.toString());
        return const ErrorView();
      },
    );
  }
}
