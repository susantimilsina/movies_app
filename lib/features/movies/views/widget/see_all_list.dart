import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movies_app/features/movies/providers/movie_provider.dart';
import 'package:movies_app/features/movies/views/widget/item_grid_builder.dart';

/// See App Movie list of See All Movie Page
class SeeAllMovieList extends ConsumerWidget {
  /// Instance of [SeeAllMovieList]
  const SeeAllMovieList({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(itemsProvider);

    return state.when(
      data: (items) {
        return items.isEmpty
            ? SliverToBoxAdapter(
                child: Column(
                  children: [
                    IconButton(
                      onPressed: () {
                        ref.read(itemsProvider.notifier).fetchFirstBatch();
                      },
                      icon: const Icon(Icons.replay),
                    ),
                    const Chip(
                      label: Text('No items Found!'),
                    ),
                  ],
                ),
              )
            : ItemsGridBuilder(
                items: items,
              );
      },
      loading: () => const SliverToBoxAdapter(
        child: Center(child: CircularProgressIndicator()),
      ),
      error: (e, stk) => SliverToBoxAdapter(
        child: Center(
          child: Column(
            children: const [
              Icon(Icons.info),
              SizedBox(
                height: 20,
              ),
              Text(
                'Something Went Wrong!',
                style: TextStyle(
                  color: Colors.black,
                ),
              ),
            ],
          ),
        ),
      ),
      onGoingLoading: (items) {
        return ItemsGridBuilder(
          items: items,
        );
      },
      onGoingError: (items, e, stk) {
        return ItemsGridBuilder(
          items: items,
        );
      },
    );
  }
}
