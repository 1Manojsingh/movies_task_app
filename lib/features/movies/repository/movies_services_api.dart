import 'package:dartz/dartz.dart';
import '../../../core/exceptions/failure.dart';
import '../../../core/services/http/http_service.dart';
import '../models/movie_list_response.dart';
import '../models/movie_model.dart';
import 'movie_service.dart';

class MoviesServiceApi implements MovieServices {
  final HttpService _httpService;
  MoviesServiceApi(this._httpService);

  @override
  Future<Either<Failure, MovieListResponse>> getTrendingMovies({
    String timeWindow = 'day',
    String language = 'en-US',
    int page = 1,
  }) async {
    try {
      final result = await _httpService.get(
        '/trending/movie/$timeWindow',
        queryParams: {
          'language': language,
          'page': page.toString(),
        },
      );
      return result.fold(
        (failure) => Left(failure),
        (response) {
          try {
            final movieListResponse = MovieListResponse.fromJson(response.data);
            return Right(movieListResponse);
          } catch (e) {
            return Left(Failure('Failed to parse trending movies: $e', 1));
          }
        },
      );
    } catch (e) {
      return Left(Failure('Error fetching trending movies: $e', 1));
    }
  }

  @override
  Future<Either<Failure, MovieListResponse>> getNowPlayingMovies({
    String language = 'en-US',
    int page = 1,
    String? region,
  }) async {
    try {
      final queryParams = <String, String>{
        'language': language,
        'page': page.toString(),
      };

      if (region != null) {
        queryParams['region'] = region;
      }

      final result = await _httpService.get(
        '/movie/now_playing',
        queryParams: queryParams,
      );

      return result.fold(
        (failure) => Left(failure),
        (response) {
          try {
            final movieListResponse = MovieListResponse.fromJson(response.data);
            return Right(movieListResponse);
          } catch (e) {
            return Left(Failure('Failed to parse now playing movies: $e', 1));
          }
        },
      );
    } catch (e) {
      return Left(Failure('Error fetching now playing movies: $e', 1));
    }
  }

  @override
  Future<Either<Failure, MovieListResponse>> getPopularMovies({
    String language = 'en-US',
    int page = 1,
    String? region,
  }) async {
    try {
      final queryParams = <String, String>{
        'language': language,
        'page': page.toString(),
      };

      if (region != null) {
        queryParams['region'] = region;
      }

      final result = await _httpService.get(
        '/movie/popular',
        queryParams: queryParams,
      );

      return result.fold(
        (failure) => Left(failure),
        (response) {
          try {
            final movieListResponse = MovieListResponse.fromJson(response.data);
            return Right(movieListResponse);
          } catch (e) {
            return Left(Failure('Failed to parse popular movies: $e', 1));
          }
        },
      );
    } catch (e) {
      return Left(Failure('Error fetching popular movies: $e', 1));
    }
  }

  @override
  Future<Either<Failure, MovieListResponse>> searchMovies({
    required String query,
    String language = 'en-US',
    int page = 1,
    bool includeAdult = false,
    String? region,
    int? year,
    int? primaryReleaseYear,
  }) async {
    try {
      final queryParams = <String, String>{
        'query': query,
        'language': language,
        'page': page.toString(),
        'include_adult': includeAdult.toString(),
      };

      if (region != null) {
        queryParams['region'] = region;
      }
      if (year != null) {
        queryParams['year'] = year.toString();
      }
      if (primaryReleaseYear != null) {
        queryParams['primary_release_year'] = primaryReleaseYear.toString();
      }

      final result = await _httpService.get(
        '/search/movie',
        queryParams: queryParams,
      );

      return result.fold(
        (failure) => Left(failure),
        (response) {
          try {
            final movieListResponse = MovieListResponse.fromJson(response.data);
            return Right(movieListResponse);
          } catch (e) {
            return Left(Failure('Failed to parse search results: $e', 1));
          }
        },
      );
    } catch (e) {
      return Left(Failure('Error searching movies: $e', 1));
    }
  }

  @override
  Future<Either<Failure, Movie>> getMovieDetails(int movieId) async {
    try {
      final result = await _httpService.get(
        '/movie/$movieId',
        queryParams: {
          'language': 'en-US',
        },
      );

      return result.fold(
        (failure) => Left(failure),
        (response) {
          try {
            final movie = Movie.fromJson(response.data);
            return Right(movie);
          } catch (e) {
            return Left(Failure('Failed to parse movie details: $e', 1));
          }
        },
      );
    } catch (e) {
      return Left(Failure('Error fetching movie details: $e', 1));
    }
  }

  @override
  Future<Either<Failure, MovieListResponse>> getSimilarMovies(
    int movieId, {
    String language = 'en-US',
    int page = 1,
  }) async {
    try {
      final result = await _httpService.get(
        '/movie/$movieId/similar',
        queryParams: {
          'language': language,
          'page': page.toString(),
        },
      );
      return result.fold(
        (failure) => Left(failure),
        (response) {
          try {
            final movieListResponse = MovieListResponse.fromJson(response.data);
            return Right(movieListResponse);
          } catch (e) {
            return Left(Failure('Failed to parse similar movies: $e', 1));
          }
        },
      );
    } catch (e) {
      return Left(Failure('Error fetching similar movies: $e', 1));
    }
  }
}
