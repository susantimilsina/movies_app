import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:movies_app/core/widgets/app_loader.dart';
import 'package:movies_app/core/widgets/error_view.dart';
import 'package:movies_app/features/movies/providers/movie_casts_provider.dart';

/// Page widget of Movie Details cast view
class MovieCastPage extends HookConsumerWidget {
  /// Creates new instance of [MovieCastPage]
  const MovieCastPage({
    required this.movieId,
    super.key,
  });

  /// Movie id
  final int movieId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final movieCastAsync = ref.watch(movieCastsProvider(movieId));

    return movieCastAsync.when(
      data: (movie) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [Container()],
        );
      },
      error: (Object error, StackTrace? stackTrace) {
        return const ErrorView();
      },
      loading: () {
        return const AppLoader();
      },
    );
  }
}
