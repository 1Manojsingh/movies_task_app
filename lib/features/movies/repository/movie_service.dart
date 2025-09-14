import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movie_task_app/features/movies/repository/movies_services_api.dart';
import '../../../core/exceptions/failure.dart';
import '../../../core/services/http/http_service_provider.dart';
import '../models/movie_list_response.dart';
import '../models/movie_model.dart';

final movieServiceProvider = Provider<MovieServices>((ref) {
  return MoviesServiceApi(ref.watch(httpServiceProvider)  );
});


abstract class MovieServices {

  Future<Either<Failure, MovieListResponse>> getTrendingMovies({
    String timeWindow = 'day',
    String language = 'en-US',
    int page = 1,
  });

  Future<Either<Failure, MovieListResponse>> getNowPlayingMovies({
    String language = 'en-US',
    int page = 1,
    String? region,
  });

  Future<Either<Failure, MovieListResponse>> getPopularMovies({
    String language = 'en-US',
    int page = 1,
    String? region,
  });

  Future<Either<Failure, MovieListResponse>> searchMovies({
    required String query,
    String language = 'en-US',
    int page = 1,
    bool includeAdult = false,
    String? region,
    int? year,
    int? primaryReleaseYear,
  });

  Future<Either<Failure, Movie>> getMovieDetails(int movieId);

  Future<Either<Failure, MovieListResponse>> getSimilarMovies(
      int movieId, {
        String language = 'en-US',
        int page = 1,
      });
}