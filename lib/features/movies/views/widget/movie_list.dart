import 'package:flutter/material.dart';
import 'package:movies_app/core/widgets/app_cached_network_image.dart';

class MovieList extends StatelessWidget {
  const MovieList({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return Container(
            padding: const EdgeInsets.all(8),
            child: InkWell(
              onTap: () {
                // Navigator.pushNamed(
                //   context,
                //   MOVIE_DETAIL_ROUTE,
                //   arguments: movie.id,
                // );
              },
              child: ClipRRect(
                borderRadius: const BorderRadius.all(Radius.circular(16)),
                child: AppCachedNetworkImage(
                  imageUrl: '',
                  customErrorWidget:
                      Image.asset('assets/images/placeholder-male.png'),
                ),
              ),
            ),
          );
        },
        itemCount: 5,
      ),
    );
  }
}
