import 'package:flutter/material.dart';
import 'package:movies_app/core/widgets/sub_heading_text.dart';
import 'package:movies_app/features/movies/views/widget/movie_list.dart';

/// TV Home Page ie Second Page of Bottom bar
class TVHomePage extends StatelessWidget {
  /// Instance of [TVHomePage]
  const TVHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: SingleChildScrollView(
        child: Column(
          children: [
            SubHeadingText(
              title: 'TV Shows',
              onTap: () {},
            ),
            const MovieList(),
            SubHeadingText(
              title: 'Popular TV Shows',
              onTap: () {},
            ),
            const MovieList(),
            SubHeadingText(
              title: 'Top Rated TV Shows',
              onTap: () {},
            ),
            const MovieList(),
          ],
        ),
      ),
    );
  }
}