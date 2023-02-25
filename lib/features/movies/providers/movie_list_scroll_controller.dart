import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// Scroll controller attached to the [GridView] widget of the
/// Movie list
///
final movieScrollControllerProvider =
    Provider.autoDispose<ScrollController>((ref) {
  final scrollController = ScrollController();
  ref.onDispose(scrollController.dispose);
  return scrollController;
});
