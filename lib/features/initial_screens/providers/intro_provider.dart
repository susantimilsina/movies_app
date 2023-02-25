import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// Scroll controller attached to the [GridView] widget of the
/// Movie list
///
final pageControllerProvider =
    Provider.autoDispose<PageController>((ref) {
  final pageController = PageController();
  ref.onDispose(pageController.dispose);
  return pageController;
});
