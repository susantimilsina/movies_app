import 'package:flutter/material.dart';
import 'package:movies_app/features/tv_series/views/widget/tv_card_list.dart';

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
          children: const [
            TVCard(),
            TVCard(),
            TVCard(),
          ],
        ),
      ),
    );
  }
}
