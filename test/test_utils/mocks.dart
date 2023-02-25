import 'package:mocktail/mocktail.dart';
import 'package:movies_app/core/services/http/http_service.dart';
import 'package:movies_app/core/services/storage/storage_service.dart';
import 'package:movies_app/features/movies/repositories/http_movie_repository.dart';

class MockStorageService extends Mock implements StorageService {}

class MockHttpService extends Mock implements HttpService {}

class MockHttpMovieRepository extends Mock implements HttpMovieRepository {}
