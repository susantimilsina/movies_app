import 'package:flutter/material.dart';
import 'package:movies_app/core/configs/app_icon_data.dart';
import 'package:movies_app/core/configs/app_icons.dart';
import 'package:movies_app/core/configs/styles/app_colors.dart';
import 'package:movies_app/core/configs/styles/spacing_size.dart';
import 'package:movies_app/features/movies/views/pages/movie_home_page.dart';
import 'package:movies_app/features/tv_series/views/pages/tv_home_page.dart';

/// Home Page/ Dashboard Page with bottom bar
class NavigationHomePage extends StatefulWidget {
  /// Instance of [NavigationHomePage]
  const NavigationHomePage({super.key});

  @override
  State<NavigationHomePage> createState() => _CoreNavigationPageState();
}

class _CoreNavigationPageState extends State<NavigationHomePage> {
  int _selectedIndex = 0;
  bool _visibleAppBar = true;

  final List<Widget> _pages = [
    const MovieHomePage(),
    const TVHomePage(),
    Container(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;

      if (index == 2) {
        _visibleAppBar = false;
      } else {
        _visibleAppBar = true;
      }
    });
  }

  // _onSearchTapped(int index) {
  // if (index == 0) {
  //   Navigator.pushNamed(context, MOVIE_SEARCH_ROUTE);
  // } else {
  //   Navigator.pushNamed(context, TV_SEARCH_ROUTE);
  // }
  // }

  // _onWatchlistTapped(int index) {
  // if (index == 0) {
  //   Navigator.pushNamed(context, MOVIE_WATCHLIST_ROUTE);
  // } else {
  //   Navigator.pushNamed(context, TV_WATCHLIST_ROUTE);
  // }
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.movie), label: 'Movies'),
          BottomNavigationBarItem(icon: Icon(Icons.tv), label: 'TV Series'),
          BottomNavigationBarItem(icon: Icon(Icons.info), label: 'About'),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: AppColors.primary,
        onTap: _onItemTapped,
      ),
      appBar: _visibleAppBar
          ? AppBar(
              title: Row(
                children: [
                  const AppIcon(
                    icon: AppIcons.netflixIcon,
                    size: 25,
                  ),
                  Spacing.sizedBoxW_06(),
                  Text(
                    'Nova',
                    style: Theme.of(context).textTheme.displayMedium,
                  )
                ],
              ),
              actions: [
                IconButton(
                  onPressed: () {
                    // _onSearchTapped(_selectedIndex);
                  },
                  icon: Icon(
                    Icons.search,
                    color: Theme.of(context).colorScheme.onSecondary,
                  ),
                )
              ],
            )
          : null,
      body: _pages.elementAt(_selectedIndex),
    );
  }
}
