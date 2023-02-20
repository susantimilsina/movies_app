import 'package:flutter/material.dart';
import 'package:movies_app/core/widgets/shimmer.dart';

/// Single Widget used for a shimmer effect
class ItemShimmer extends StatelessWidget {
  /// Instance of [ItemShimmer]
  const ItemShimmer({
    super.key,
    this.minOpacity = 0.05,
    this.maxOpacity = 0.1,
  });

  /// Minimum opacity of the shimmer effect
  final double minOpacity;

  /// Maximum opacity of the shimmer effect
  final double maxOpacity;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      child: Shimmer(
        height: 190,
        width: 120,
        minOpacity: minOpacity,
        maxOpacity: maxOpacity,
      ),
    );
  }
}
