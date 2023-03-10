import 'package:flutter/material.dart';
import 'package:movies_app/core/configs/styles/app_colors.dart';

/// Outline chip for Movie small Details
class OutlinedChip extends StatelessWidget {
  ///Instance of [OutlinedChip]
  const OutlinedChip({
    required this.label,
    this.icon,
    super.key,
  });

  /// Label/title in the chip
  final String label;

  /// Icon on the chip
  final Widget? icon;

  @override
  Widget build(BuildContext context) {
    return Chip(
      avatar: (icon != null) ? icon : null,
      label: Text(
        label,
        style: Theme.of(context).textTheme.bodySmall?.copyWith(
              color: AppColors.primary,
            ),
      ),
      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
      backgroundColor: Colors.transparent,
      visualDensity: VisualDensity.compact,
      elevation: 0,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(5)),
        side: BorderSide(
          width: 1,
          color: AppColors.primary,
        ),
      ),
      padding: EdgeInsets.zero,
      labelPadding: const EdgeInsets.symmetric(horizontal: 10, vertical: 0),
    );
  }
}
