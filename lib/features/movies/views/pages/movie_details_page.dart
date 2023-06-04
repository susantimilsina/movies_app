import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:movies_app/core/utils/app_haptics.dart';
import 'package:movies_app/features/movies/views/widget/blurred_blackdrop_image.dart';
import 'package:movies_app/features/movies/views/widget/expanded_app_bar_content.dart';
import 'package:movies_app/features/movies/views/widget/movie_detailed_description.dart';

/// Page widget of Movie Details
class MovieDetailsPage extends HookConsumerWidget {
  /// Creates new instance of [MovieDetailsPage]
  const MovieDetailsPage({
    required this.movieName,
    required this.movieId,
    required this.backdropPath,
    required this.posterPath,
    super.key,
  });

  /// Movie name
  final String movieName;

  /// Movie backdrop url
  final String? backdropPath;

  /// Movie backdrop url
  final String? posterPath;

  /// Movie id
  final int movieId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    const collapsedBarHeight = 60.0;
    const expandedBarHeight = 350.0;

    final scrollController = useScrollController();
    final isCollapsed = useState(false);
    final didAddFeedback = useState(false);

    return Scaffold(
      body: NotificationListener<ScrollNotification>(
        onNotification: (notification) {
          isCollapsed.value = scrollController.hasClients &&
              scrollController.offset >
                  (expandedBarHeight - collapsedBarHeight);
          if (isCollapsed.value && !didAddFeedback.value) {
            AppHaptics.mediumImpact();
            didAddFeedback.value = true;
          } else if (!isCollapsed.value) {
            didAddFeedback.value = false;
          }
          return false;
        },
        child: Stack(
          children: [
            BlurredBackdropImage(
              backdropPath: posterPath ?? '',
            ),
            CustomScrollView(
              controller: scrollController,
              slivers: [
                SliverAppBar(
                  expandedHeight: expandedBarHeight,
                  collapsedHeight: collapsedBarHeight,
                  centerTitle: false,
                  pinned: true,
                  title: AnimatedOpacity(
                    duration: const Duration(milliseconds: 200),
                    opacity: isCollapsed.value ? 1 : 0,
                    child: Padding(
                      padding: const EdgeInsets.all(8),
                      child: Text(
                        movieName,
                        style: Theme.of(context).textTheme.displayMedium,
                      ),
                    ),
                  ),
                  elevation: 0,
                  backgroundColor: isCollapsed.value
                      ? Theme.of(context).colorScheme.background
                      : Colors.transparent,
                  leading: BackButton(
                    color: Theme.of(context).colorScheme.onSecondary,
                  ),
                  flexibleSpace: FlexibleSpaceBar(
                    background: ExpandedAppBarContent(
                      backdropPath: backdropPath ?? '',
                      movieName: movieName,
                    ),
                  ),
                ),
                MovieDetailedDescription(
                  movieId: movieId,
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
