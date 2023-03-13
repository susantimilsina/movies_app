import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:movies_app/core/models/paginated_response.dart';
import 'package:movies_app/core/widgets/error_view.dart';
import 'package:movies_app/features/movies/models/movie_model.dart';
import 'package:movies_app/features/movies/providers/movie_provider.dart';
import 'package:movies_app/features/movies/views/pages/movie_home_page.dart';
import '../../../../test_utils/pump_app.dart';

void main() {
  testWidgets(
    'Renders ErrorView on provider error',
    (WidgetTester tester) async {
      await tester.pumpProviderApp(
        const MovieHomePage(),
        overrides: [
          paginatedNowPlayingMovieProvider(0).overrideWithProvider(
            FutureProvider<PaginatedResponse<MovieModel>>(
              (ref) => throw Exception(),
            ),
          ),
        ],
      );

      await tester.pumpAndSettle();
      expect(find.byType(ErrorView), findsOneWidget);
    },
    skip: true,
  );
}
