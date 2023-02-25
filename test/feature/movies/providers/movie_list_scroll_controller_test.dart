import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:movies_app/features/movies/providers/movie_list_scroll_controller.dart';

void main() {
  test('movieScrollControllerProvider is a ScrollController', () {
    final container = ProviderContainer();

    final scrollController = container.read(movieScrollControllerProvider);

    expect(scrollController, isA<ScrollController>());
  });
}
