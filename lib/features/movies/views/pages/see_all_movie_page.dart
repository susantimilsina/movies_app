import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movies_app/features/movies/providers/see_all_page_provider.dart';
import 'package:movies_app/features/movies/views/widget/see_all_list.dart';

/// See App Movie Page According to See All Tap
class SeeAllMoviePage extends ConsumerWidget {
  /// Instance of [SeeAllMoviePage]
  const SeeAllMoviePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final seeAllPageStatus = ref.watch(seeAllPageStatusProvider);
    return Scaffold(
      appBar: AppBar(
        title: Text(seeAllPageStatus.toStr),
      ),
      body: const SeeAllMovieList(),
    );
  }
}
