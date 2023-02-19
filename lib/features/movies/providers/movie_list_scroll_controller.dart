import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// Scroll controller attached to the [ListView] widget of the
/// Movie list
///
/// Accessed in AppBar to scroll to top
final movieScrollControllerProvider = Provider<ScrollController>((ref) {
  final scrollController = ScrollController();
  ref.onDispose(scrollController.dispose);
  return scrollController;
});
