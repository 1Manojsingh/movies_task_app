import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/movie_list_response.dart';
import '../repository/movie_service.dart';


final trendingMoviesProvider = FutureProvider.family<MovieListResponse, Map<String, dynamic>>((ref, params) async {
  final movieService = ref.read(movieServiceProvider);
  final result = await movieService.getTrendingMovies(
    timeWindow: params['timeWindow'] ?? 'day',
    language: params['language'] ?? 'en-US',
    page: params['page'] ?? 1,
  );
  return result.fold(
    (failure) => throw Exception(failure.message),
    (movies) => movies,
  );
});

final nowPlayingMoviesProvider = FutureProvider.family<MovieListResponse, Map<String, dynamic>>((ref, params) async {
  final movieService = ref.read(movieServiceProvider);
  final result = await movieService.getNowPlayingMovies(
    language: params['language'] ?? 'en-US',
    page: params['page'] ?? 1,
    region: params['region'],
  );
  return result.fold(
    (failure) => throw Exception(failure.message),
    (movies) => movies,
  );
});


final searchMoviesProvider = FutureProvider.family<MovieListResponse, Map<String, dynamic>>((ref, params) async {
  final movieService = ref.read(movieServiceProvider);
  final result = await movieService.searchMovies(
    query: params['query'] ?? '',
    language: params['language'] ?? 'en-US',
    page: params['page'] ?? 1,
    includeAdult: params['includeAdult'] ?? false,
    region: params['region'],
    year: params['year'],
    primaryReleaseYear: params['primaryReleaseYear'],
  );
  
  return result.fold(
    (failure) => throw Exception(failure.message),
    (movies) => movies,
  );
});
