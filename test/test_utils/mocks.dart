import 'package:mocktail/mocktail.dart';
import 'package:movies_app/core/services/http/http_service.dart';
import 'package:movies_app/core/services/storage/storage_service.dart';
import 'package:movies_app/features/movies/repositories/movie_repository.dart';

class MockStorageService extends Mock implements StorageService {}

class MockHttpService extends Mock implements HttpService {}

class MockMovieRepository extends Mock implements MovieRepository {}

class Listener<T> extends Mock {
  void call(T? previous, T value);
}
