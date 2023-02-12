import 'package:flutter/material.dart';
import 'package:movies_app/core/widgets/sub_heading_text.dart';
import 'package:movies_app/features/movies/views/widget/movie_list.dart';

/// Movie Home Page ie First Page of Bottom bar
class MovieHomePage extends StatelessWidget {
  /// Instance of [MovieHomePage]
  const MovieHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: SingleChildScrollView(
        child: Column(
          children: [
            SubHeadingText(
              title: 'Now Playing',
              onTap: () {},
            ),
            const MovieList(),
            SubHeadingText(
              title: 'Popular',
              onTap: () {},
            ),
            const MovieList(),
            SubHeadingText(
              title: 'Top Rated',
              onTap: () {},
            ),
            const MovieList(),
          ],
        ),
      ),
    );
  }
}
