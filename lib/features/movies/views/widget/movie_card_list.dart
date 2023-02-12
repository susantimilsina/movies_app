import 'package:flutter/material.dart';
import 'package:movies_app/core/configs/styles/spacing_size.dart';
import 'package:movies_app/core/widgets/app_cached_network_image.dart';

/// Movie Card for Home Page
class MovieCard extends StatelessWidget {
  /// Creates a new instance of [MovieCard]
  const MovieCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 4),
      child: InkWell(
        onTap: () {
          // Navigator.pushNamed(
          //   context,
          //   MOVIE_DETAIL_ROUTE,
          //   arguments: movie.id,
          // );
        },
        child: Stack(
          alignment: Alignment.bottomLeft,
          children: [
            Card(
              child: Container(
                margin: const EdgeInsets.only(
                  left: 16 + 80 + 16,
                  bottom: 8,
                  right: 8,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children:  [
                    Text(
                      'Movie Title',
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                    Spacing.sizedBoxH_16(),
                    const Text(
                      'Movie OverVIew',
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(
                left: 16,
                bottom: 16,
              ),
              child: const ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(8)),
                child: AppCachedNetworkImage(
                  key: ValueKey(
                    'key1',
                  ),
                  imageUrl: '',
                  fit: BoxFit.fitWidth,
                  isLoaderShimmer: false,
                  alignment: Alignment.topCenter,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
