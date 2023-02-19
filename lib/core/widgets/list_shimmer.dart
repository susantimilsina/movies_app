import 'package:flutter/material.dart';
import 'package:movies_app/core/widgets/item_shimmer.dart';

/// Widget used for a List shimmer effect
class ListShimmer extends StatelessWidget {
  /// Creates a new instance of [ListShimmer]
  const ListShimmer({
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
    return SizedBox(
      height: 190,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) => Container(
          padding: const EdgeInsets.all(8),
          child: ItemShimmer(
            minOpacity: minOpacity,
            maxOpacity: maxOpacity,
          ),
        ),
        itemCount: 5,
      ),
    );
  }
}
