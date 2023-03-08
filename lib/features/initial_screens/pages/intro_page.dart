// ignore_for_file: no_leading_underscores_for_local_identifiers,noop_primitive,noop_primitive_operations_operations, lines_longer_than_80_chars, noop_primitive_operations
import 'package:auto_route/auto_route.dart';
import 'package:extra_alignments/extra_alignments.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:movies_app/core/configs/app_icons.dart';
import 'package:movies_app/core/configs/styles/app_colors.dart';
import 'package:movies_app/core/utils/app_haptics.dart';
import 'package:movies_app/core/widgets/app_page_indicator.dart';
import 'package:movies_app/core/widgets/gradient_container.dart';
import 'package:movies_app/features/initial_screens/providers/intro_provider.dart';
import 'package:movies_app/route/app_router.gr.dart';

/// Intro page of Nova App
class IntroPage extends ConsumerWidget {
  ///Instance of  [IntroPage]
  const IntroPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    const _imageSize = 250.0;
    const _logoHeight = 126.0;
    const _textHeight = 100.0;
    const _pageIndicatorHeight = 55.0;
    final pageData = <PageData>[
      const PageData(
        'The Ultimate movie experience app',
        'Welcome to CineVerse, the ultimate movie experience app!',
        'witcher',
        '1',
      ),
      const PageData(
        'Explore an extensive collection of movies',
        'explore an extensive collection of movies from various genres and languages.',
        'joker',
        '2',
      ),
      const PageData(
        'Ready to embark on a cinematic journey',
        'Get ready to embark on a cinematic journey like no other with CineVerse!',
        'city',
        '3',
      ),
    ];

    final _currentPage = ValueNotifier(0);
    final pageController = ref.watch(pageControllerProvider);

    // This view uses a full screen PageView to enable swipe navigation.
    // However, we only want the title / description to actually swipe,
    // so we stack a PageView with that content over top of all the other
    // content, and line up their layouts.
    final List<Widget> pages = pageData.map((e) => _Page(data: e)).toList();
    bool _isOnLastPage() {
      return _currentPage.value.round() == pageData.length - 1;
    }

    void _handlePageChanged() {
      final newPage = pageController.page?.round() ?? 0;
      _currentPage.value = newPage;
    }

    pageController.addListener(_handlePageChanged);

    void _handleIntroCompletePressed() {
      if (_currentPage.value == pageData.length - 1) {
        context.router.replaceAll([const NavigationHomeRoute()]);
      }
    }

    void _handleSemanticSwipe(int dir) {
      pageController.animateToPage(
        (pageController.page ?? 0).round() + dir,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeOut,
      );
    }

    void _handleNavTextDoubleTapped() {
      final current = pageController.page!.round();
      if (_isOnLastPage()) return;
      pageController.animateToPage(
        current + 1,
        duration: const Duration(milliseconds: 250),
        curve: Curves.easeIn,
      );
    }

    Widget _buildHzGradientOverlay({bool left = false}) {
      return Align(
        alignment: Alignment(left ? -1 : 1, 0),
        child: FractionallySizedBox(
          widthFactor: .5,
          child: Padding(
            padding:
                EdgeInsets.only(left: left ? 0 : 200, right: left ? 200 : 0),
            child: Transform.scale(
              scaleX: left ? -1 : 1,
              child: HzGradient(
                [
                  Theme.of(context).colorScheme.background.withOpacity(0),
                  Theme.of(context).colorScheme.background,
                ],
                const [0, .2],
              ),
            ),
          ),
        ),
      );
    }

    Widget _buildFinishBtn(BuildContext context) {
      return ValueListenableBuilder<int>(
        valueListenable: _currentPage,
        builder: (_, pageIndex, __) {
          return AnimatedOpacity(
            opacity: pageIndex == pageData.length - 1 ? 1 : 0,
            duration: const Duration(milliseconds: 300),
            child: Semantics(
              label: 'Swipe left to continue',
              child: RawMaterialButton(
                onPressed: _handleIntroCompletePressed,
                materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                elevation: 2,
                fillColor: Theme.of(context).colorScheme.primary,
                padding: const EdgeInsets.all(15),
                shape: const CircleBorder(),
                child: const Icon(
                  Icons.arrow_forward,
                  size: 22,
                ),
              ),
            ),
          );
        },
      );
    }

    Widget _buildNavText(BuildContext context) {
      return ValueListenableBuilder(
        valueListenable: _currentPage,
        builder: (_, pageIndex, __) {
          return AnimatedOpacity(
            opacity: pageIndex == pageData.length - 1 ? 0 : 1,
            duration: const Duration(milliseconds: 300),
            child: Semantics(
              onTapHint: 'Navigate',
              onTap: _isOnLastPage() ? null : _handleNavTextDoubleTapped,
              child: Text(
                'Swipe left to continue',
                style: Theme.of(context).textTheme.bodySmall,
              ),
            ),
          );
        },
      );
    }

    return Scaffold(
      body: ColoredBox(
        color: Theme.of(context).colorScheme.background,
        child: SafeArea(
          child: Stack(
            children: [
              // page view with title & description:
              MergeSemantics(
                child: Semantics(
                  onIncrease: () => _handleSemanticSwipe(1),
                  onDecrease: () => _handleSemanticSwipe(-1),
                  child: PageView(
                    controller: pageController,
                    children: pages,
                    onPageChanged: (_) => AppHaptics.lightImpact(),
                  ),
                ),
              ),
              IgnorePointer(
                ignoringSemantics: false,
                child: Column(
                  children: [
                    const Spacer(),
                    // logo:
                    Semantics(
                      header: true,
                      child: Container(
                        height: _logoHeight,
                        alignment: Alignment.center,
                        child: _NovaLogo(),
                      ),
                    ),

                    // masked image:
                    SizedBox(
                      height: _imageSize,
                      width: _imageSize,
                      child: ValueListenableBuilder<int>(
                        valueListenable: _currentPage,
                        builder: (_, value, __) {
                          return AnimatedSwitcher(
                            duration: const Duration(milliseconds: 900),
                            child: KeyedSubtree(
                              key: ValueKey(
                                value,
                              ), // so AnimatedSwitcher sees it as a different child.
                              child: _PageImage(data: pageData[value]),
                            ),
                          );
                        },
                      ),
                    ),

                    // placeholder gap for text:
                    const Gap(_textHeight),

                    // page indicator:
                    Container(
                      height: _pageIndicatorHeight,
                      alignment: Alignment.center,
                      child: AppPageIndicator(
                        count: pageData.length,
                        controller: pageController,
                        color: Theme.of(context).colorScheme.onSecondary,
                      ),
                    ),

                    const Spacer(flex: 2),
                  ],
                ),
              ),
              // Build a cpl overlays to hide the content when swiping on very wide screens
              _buildHzGradientOverlay(left: true),
              _buildHzGradientOverlay(),

              // finish button:
              Positioned(
                right: 32,
                bottom: 32,
                child: _buildFinishBtn(context),
              ),

              // nav help text:
              BottomCenter(
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 32),
                  child: _buildNavText(context),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

@immutable

/// Intro Screen Page Model
class PageData {
  /// Constructor of [PageData]
  const PageData(this.title, this.desc, this.img, this.mask);

  /// title on the page
  final String title;

  /// description on the page
  final String desc;

  ///image for the page
  final String img;

  ///mask used in the page
  final String mask;
}

class _Page extends StatelessWidget {
  const _Page({
    required this.data,
  });

  final PageData data;

  @override
  Widget build(BuildContext context) {
    return Semantics(
      liveRegion: true,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          children: [
            const Spacer(),
            const Gap(380),
            SizedBox(
              height: 100,
              width: 400,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    data.title,
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                  const Gap(16),
                  Text(
                    data.desc,
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                ],
              ),
            ),
            const Gap(55),
            const Spacer(flex: 2),
          ],
        ),
      ),
    );
  }
}

class _NovaLogo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ExcludeSemantics(
          child: SvgPicture.asset(
            AppIcons.compassSimple,
            // ignore: deprecated_member_use
            color: AppColors.white,
            height: 48,
          ),
        ),
        const Gap(8),
        Text(
          'Nova',
          style: Theme.of(context).textTheme.displayLarge,
        ),
      ],
    );
  }
}

class _PageImage extends StatelessWidget {
  const _PageImage({
    required this.data,
  });

  final PageData data;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox.expand(
          child: Image.asset(
            '${AppIcons.pathCommon}/intro-${data.img}.jpeg',
            fit: BoxFit.fill,
            alignment: Alignment.centerRight,
          ),
        ),
        Positioned.fill(
          child: Image.asset(
            '${AppIcons.pathCommon}/intro-mask-${data.mask}.png',
            fit: BoxFit.fill,
            color: Theme.of(context).colorScheme.background,
          ),
        ),
      ],
    );
  }
}
