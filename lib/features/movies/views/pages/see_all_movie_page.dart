import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movies_app/core/configs/styles/spacing_size.dart';
import 'package:movies_app/features/movies/providers/movie_provider.dart';
import 'package:movies_app/features/movies/providers/see_all_page_provider.dart';
import 'package:movies_app/features/movies/views/widget/see_all_list.dart';
import 'package:movies_app/features/pagination/widgets/no_more_items.dart';
import 'package:movies_app/features/pagination/widgets/on_going_bottomsheet.dart';

/// See App Movie Page According to See All Tap
class SeeAllMoviePage extends ConsumerWidget {
  /// Instance of [SeeAllMoviePage]
  const SeeAllMoviePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final seeAllPageStatus = ref.watch(seeAllPageStatusProvider);
    final scrollController = ScrollController();
    scrollController.addListener(() {
      final maxScroll = scrollController.position.maxScrollExtent;
      final currentScroll = scrollController.position.pixels;
      final delta = MediaQuery.of(context).size.width * 0.20;
      if (maxScroll - currentScroll <= delta) {
        ref.read(itemsProvider.notifier).fetchNextBatch();
      }
    });

    return Scaffold(
      body: CustomScrollView(
        controller: scrollController,
        restorationId: 'items List',
        slivers: [
          SliverAppBar(
            centerTitle: true,
            pinned: true,
            title: Text(seeAllPageStatus.toStr),
          ),
          SliverToBoxAdapter(
            child: Spacing.sizedBoxH_20(),
          ),
          const SeeAllMovieList(),
          const NoMoreItems(),
          const OnGoingBottomWidget(),
        ],
      ),
    );
  }
}
