import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movies_app/features/movies/providers/movie_provider.dart';

/// On Going Fetch Widget For Pagination
class OnGoingBottomWidget extends ConsumerWidget {
  /// Instance of [OnGoingBottomWidget]
  const OnGoingBottomWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(itemsProvider);
    return SliverPadding(
      padding: const EdgeInsets.all(40),
      sliver: SliverToBoxAdapter(
        child: state.maybeWhen(
          orElse: () => const SizedBox.shrink(),
          onGoingLoading: (items) =>
              const Center(child: CircularProgressIndicator()),
          onGoingError: (items, e, stk) => Center(
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
      ),
    );
  }
}
