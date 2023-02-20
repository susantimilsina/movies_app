import 'package:flutter/material.dart';
import 'package:movies_app/features/movies/models/movie_model.dart';
import 'package:movies_app/features/movies/views/widget/movie_card.dart';

/// Item Grid Builder For Paginated Movie See All View
class ItemsGridBuilder extends StatelessWidget {
  /// Instance of [ItemsGridBuilder]
  const ItemsGridBuilder({
    required this.items,
    super.key,
  });

  /// List of Movie Items
  final List<MovieModel> items;

  @override
  Widget build(BuildContext context) {
    return SliverGrid.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 10,
        crossAxisSpacing: 10,
        childAspectRatio: 1,
        mainAxisExtent: 275,
      ),
      itemBuilder: (context, index) {
        return MovieCard(
          singleMovie: items[index],
        );
      },
      itemCount: items.length,
    );
  }
}
