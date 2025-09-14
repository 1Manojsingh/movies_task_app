import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../repository/movie_service.dart';
import '../models/movie_model.dart';

class PaginatedMovieState {
  final List<Movie> movies;
  final int currentPage;
  final int totalPages;
  final int totalResults;
  final bool isLoading;
  final bool hasMore;
  final String? error;

  const PaginatedMovieState({
    this.movies = const [],
    this.currentPage = 0,
    this.totalPages = 0,
    this.totalResults = 0,
    this.isLoading = false,
    this.hasMore = true,
    this.error,
  });

  PaginatedMovieState copyWith({
    List<Movie>? movies,
    int? currentPage,
    int? totalPages,
    int? totalResults,
    bool? isLoading,
    bool? hasMore,
    String? error,
  }) {
    return PaginatedMovieState(
      movies: movies ?? this.movies,
      currentPage: currentPage ?? this.currentPage,
      totalPages: totalPages ?? this.totalPages,
      totalResults: totalResults ?? this.totalResults,
      isLoading: isLoading ?? this.isLoading,
      hasMore: hasMore ?? this.hasMore,
      error: error ?? this.error,
    );
  }
}

class PaginatedTrendingMoviesNotifier extends StateNotifier<PaginatedMovieState> {
  final MovieServices _movieService;
  final String timeWindow;
  final String language;

  PaginatedTrendingMoviesNotifier({
    required MovieServices movieService,
    this.timeWindow = 'day',
    this.language = 'en-US',
  }) : _movieService = movieService, super(const PaginatedMovieState());

  Future<void> loadInitial() async {
    if (state.isLoading) return;
    
    print('Loading initial trending movies...');
    state = state.copyWith(isLoading: true, error: null);
    
    final result = await _movieService.getTrendingMovies(
      timeWindow: timeWindow,
      language: language,
      page: 1,
    );

    result.fold(
      (failure) {
        print('Error loading trending movies: ${failure.message}');
        Future.delayed(const Duration(seconds: 2), () {
          loadInitial();
        });
        state = state.copyWith(
          isLoading: true,
          error: null,
        );
      },
      (response) {
        print('Successfully loaded ${response.results?.length ?? 0} trending movies');
        state = state.copyWith(
          movies: response.results ?? [],
          currentPage: response.page ?? 1,
          totalPages: response.totalPages ?? 0,
          totalResults: response.totalResults ?? 0,
          isLoading: false,
          hasMore: (response.page ?? 1) < (response.totalPages ?? 0),
        );
      },
    );
  }

  Future<void> loadMore() async {
    if (state.isLoading || !state.hasMore) return;
    
    state = state.copyWith(isLoading: true, error: null);
    await Future.delayed(const Duration(milliseconds: 500));
    
    try {
      final result = await _movieService.getTrendingMovies(
        timeWindow: timeWindow,
        language: language,
        page: state.currentPage + 1,
      );

      result.fold(
        (failure) {
          print('Error loading more trending movies: ${failure.message}');
          Future.delayed(const Duration(seconds: 2), () {
            loadMore();
          });
          state = state.copyWith(
            isLoading: true,
            error: null,
          );
        },
        (response) {
          print('Successfully loaded ${response.results?.length ?? 0} more trending movies');
          final newMovies = <Movie>[...state.movies, ...(response.results ?? [])];
          state = state.copyWith(
            movies: newMovies,
            currentPage: response.page ?? state.currentPage + 1,
            totalPages: response.totalPages ?? state.totalPages,
            totalResults: response.totalResults ?? state.totalResults,
            isLoading: false,
            hasMore: (response.page ?? state.currentPage + 1) < (response.totalPages ?? 0),
          );
        },
      );
    } catch (e) {
      Future.delayed(const Duration(seconds: 2), () {
        loadMore();
      });
      state = state.copyWith(
        isLoading: true,
        error: null,
      );
    }
  }

  void reset() {
    state = const PaginatedMovieState();
  }

  void clearError() {
    state = state.copyWith(error: null);
  }
}

class PaginatedNowPlayingMoviesNotifier extends StateNotifier<PaginatedMovieState> {
  final MovieServices _movieService;
  final String language;
  final String? region;

  PaginatedNowPlayingMoviesNotifier({
    required MovieServices movieService,
    this.language = 'en-US',
    this.region,
  }) : _movieService = movieService, super(const PaginatedMovieState());

  Future<void> loadInitial() async {
    if (state.isLoading) return;
    
    print('Loading initial now playing movies...');
    state = state.copyWith(isLoading: true, error: null);
    
    final result = await _movieService.getNowPlayingMovies(
      language: language,
      page: 1,
      region: region,
    );

    result.fold(
      (failure) {
        print('Error loading now playing movies: ${failure.message}');
        Future.delayed(const Duration(seconds: 2), () {
          loadInitial();
        });
        state = state.copyWith(
          isLoading: true,
          error: null,
        );
      },
      (response) {
        print('Successfully loaded ${response.results?.length ?? 0} now playing movies');
        state = state.copyWith(
          movies: response.results ?? [],
          currentPage: response.page ?? 1,
          totalPages: response.totalPages ?? 0,
          totalResults: response.totalResults ?? 0,
          isLoading: false,
          hasMore: (response.page ?? 1) < (response.totalPages ?? 0),
        );
      },
    );
  }

  Future<void> loadMore() async {
    if (state.isLoading || !state.hasMore) return;
    
    print('Loading more now playing movies - Page: ${state.currentPage + 1}');
    state = state.copyWith(isLoading: true, error: null);
    
    await Future.delayed(const Duration(milliseconds: 500));
    
    try {
      final result = await _movieService.getNowPlayingMovies(
        language: language,
        page: state.currentPage + 1,
        region: region,
      );

      result.fold(
        (failure) {
          print('Error loading more now playing movies: ${failure.message}');
          Future.delayed(const Duration(seconds: 2), () {
            loadMore();
          });
          state = state.copyWith(
            isLoading: true,
            error: null,
          );
        },
        (response) {
          print('Successfully loaded ${response.results?.length ?? 0} more now playing movies');
          final newMovies = <Movie>[...state.movies, ...(response.results ?? [])];
          state = state.copyWith(
            movies: newMovies,
            currentPage: response.page ?? state.currentPage + 1,
            totalPages: response.totalPages ?? state.totalPages,
            totalResults: response.totalResults ?? state.totalResults,
            isLoading: false,
            hasMore: (response.page ?? state.currentPage + 1) < (response.totalPages ?? 0),
          );
        },
      );
    } catch (e) {
      print('Exception loading more now playing movies: $e');
      Future.delayed(const Duration(seconds: 2), () {
        loadMore();
      });
      state = state.copyWith(
        isLoading: true,
        error: null,
      );
    }
  }

  void reset() {
    state = const PaginatedMovieState();
  }

  void clearError() {
    state = state.copyWith(error: null);
  }
}

class PaginatedPopularMoviesNotifier extends StateNotifier<PaginatedMovieState> {
  final MovieServices _movieService;
  final String language;
  final String? region;

  PaginatedPopularMoviesNotifier({
    required MovieServices movieService,
    this.language = 'en-US',
    this.region,
  }) : _movieService = movieService, super(const PaginatedMovieState());

  Future<void> loadInitial() async {
    if (state.isLoading) return;
    
    state = state.copyWith(isLoading: true, error: null);
    
    final result = await _movieService.getPopularMovies(
      language: language,
      page: 1,
      region: region,
    );

    result.fold(
      (failure) {
        Future.delayed(const Duration(seconds: 2), () {
          loadInitial();
        });
        state = state.copyWith(
          isLoading: true,
          error: null,
        );
      },
      (response) => state = state.copyWith(
        movies: response.results ?? [],
        currentPage: response.page ?? 1,
        totalPages: response.totalPages ?? 0,
        totalResults: response.totalResults ?? 0,
        isLoading: false,
        hasMore: (response.page ?? 1) < (response.totalPages ?? 0),
      ),
    );
  }

  Future<void> loadMore() async {
    if (state.isLoading || !state.hasMore) return;
    
    state = state.copyWith(isLoading: true, error: null);
    
    final result = await _movieService.getPopularMovies(
      language: language,
      page: state.currentPage + 1,
      region: region,
    );

    result.fold(
      (failure) {
        Future.delayed(const Duration(seconds: 2), () {
          loadMore();
        });
        state = state.copyWith(
          isLoading: true,
          error: null,
        );
      },
      (response) {
        final newMovies = <Movie>[...state.movies, ...(response.results ?? [])];
        state = state.copyWith(
          movies: newMovies,
          currentPage: response.page ?? state.currentPage + 1,
          totalPages: response.totalPages ?? state.totalPages,
          totalResults: response.totalResults ?? state.totalResults,
          isLoading: false,
          hasMore: (response.page ?? state.currentPage + 1) < (response.totalPages ?? 0),
        );
      },
    );
  }

  void reset() {
    state = const PaginatedMovieState();
  }

  void clearError() {
    state = state.copyWith(error: null);
  }
}

final paginatedTrendingMoviesProvider = StateNotifierProvider.family<PaginatedTrendingMoviesNotifier, PaginatedMovieState, Map<String, dynamic>>((ref, params) {
  return PaginatedTrendingMoviesNotifier(
    movieService: ref.read(movieServiceProvider),
    timeWindow: params['timeWindow'] ?? 'day',
    language: params['language'] ?? 'en-US',
  );
});

final paginatedNowPlayingMoviesProvider = StateNotifierProvider.family<PaginatedNowPlayingMoviesNotifier, PaginatedMovieState, Map<String, dynamic>>((ref, params) {
  return PaginatedNowPlayingMoviesNotifier(
    movieService: ref.read(movieServiceProvider),
    language: params['language'] ?? 'en-US',
    region: params['region'],
  );
});

final paginatedPopularMoviesProvider = StateNotifierProvider.family<PaginatedPopularMoviesNotifier, PaginatedMovieState, Map<String, dynamic>>((ref, params) {
  return PaginatedPopularMoviesNotifier(
    movieService: ref.read(movieServiceProvider),
    language: params['language'] ?? 'en-US',
    region: params['region'],
  );
});
