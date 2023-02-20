// ignore_for_file: inference_failure_on_function_return_type

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movies_app/core/configs/styles/app_colors.dart';
import 'package:movies_app/features/movies/enums/movie_page.dart';
import 'package:movies_app/features/movies/providers/see_all_page_provider.dart';
import 'package:movies_app/route/app_router.gr.dart';

/// Movie Heading Text for HomePage
class MovieHeadingText extends ConsumerWidget {
  ///Instance of [MovieHeadingText]
  const MovieHeadingText({
    required this.moviePage,
    super.key,
  });

  /// Title for the widget from Movie
  final MoviePage moviePage;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          moviePage.toStr,
          style: Theme.of(context).textTheme.headlineMedium,
        ),
        InkWell(
          onTap: () {
            ref.read(seeAllPageStatusProvider.notifier).changePage(moviePage);
            // ref.invalidate(itemsProvider);
            context.router.push(const SeeAllMovieRoute());
          },
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
