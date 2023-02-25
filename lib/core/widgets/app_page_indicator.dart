import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

/// App Page Indicator for Intro Screen or Carousel
class AppPageIndicator extends StatefulWidget {
  /// Instance of [AppPageIndicator]
  const AppPageIndicator({
    required this.count,
    required this.controller,
    super.key,
    this.onDotPressed,
    this.color,
    this.dotSize,
    String? semanticPageTitle,
  }) : semanticPageTitle = semanticPageTitle ?? '';

  ///number of pages or dots on the indicator
  final int count;

  /// Page View Controller
  final PageController controller;

  ///On dot press of the indicator function
  final void Function(int index)? onDotPressed;

  ///Color of the indicator
  final Color? color;

  ///Size of the dot
  final double? dotSize;

  ///Semantic title
  final String semanticPageTitle;

  @override
  State<AppPageIndicator> createState() => _AppPageIndicatorState();
}

class _AppPageIndicatorState extends State<AppPageIndicator> {
  final _currentPage = ValueNotifier(0);

  @override
  void initState() {
    super.initState();
    widget.controller.addListener(_handlePageChanged);
  }

  // int get _controllerPage => _currentPage.value;

  void _handlePageChanged() {
    _currentPage.value = widget.controller.page!.round();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          color: Colors.transparent,
          height: 30,
          alignment: Alignment.center,
          child: ValueListenableBuilder<int>(
            valueListenable: _currentPage,
            builder: (_, value, child) {
              return Semantics(
                liveRegion: true,
                focusable: false,
                readOnly: true,
                label: widget.semanticPageTitle,
                child: Container(),
              );
            },
          ),
        ),
        Positioned.fill(
          child: Center(
            child: ExcludeSemantics(
              child: SmoothPageIndicator(
                controller: widget.controller,
                count: widget.count,
                onDotClicked: widget.onDotPressed,
                effect: ExpandingDotsEffect(
                  dotWidth: widget.dotSize ?? 6,
                  dotHeight: widget.dotSize ?? 6,
                  paintStyle: PaintingStyle.fill,
                  strokeWidth: (widget.dotSize ?? 6) / 2,
                  dotColor:
                      widget.color ?? Theme.of(context).colorScheme.secondary,
                  activeDotColor:
                      widget.color ?? Theme.of(context).colorScheme.secondary,
                  expansionFactor: 2,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
