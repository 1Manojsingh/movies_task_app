import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';
import '../models/movie_model.dart';
import '../repository/movie_service.dart';

final searchQueryProvider = StateProvider<String>((ref) => '');

final searchMoviesProvider = FutureProvider.family<List<Movie>, String>((ref, query) async {
  if (query.isEmpty) return <Movie>[];
  final movieService = ref.read(movieServiceProvider);
  final result = await movieService.searchMovies(query: query);
  return result.fold(
    (failure) {
      return <Movie>[];
    },
    (response) => response.results ?? <Movie>[],
  );
});

final searchHistoryProvider = StateNotifierProvider<SearchHistoryNotifier, List<String>>((ref) {
  return SearchHistoryNotifier();
});

class SearchHistoryNotifier extends StateNotifier<List<String>> {
  SearchHistoryNotifier() : super([]);
  static const String _key = 'search_history';
  static const int _maxHistory = 10;

  Future<void> loadRecentSearches() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final historyJson = prefs.getString(_key);
      if (historyJson != null) {
        final List<dynamic> historyList = json.decode(historyJson);
        state = historyList.cast<String>();
      }
    } catch (e) {
      state = [];
    }
  }

  Future<void> addToHistory(String query) async {
    if (query.trim().isEmpty) return;
    state = state.where((item) => item != query).toList();
    state = [query, ...state];
    if (state.length > _maxHistory) {
      state = state.take(_maxHistory).toList();
    }
    await _saveToPreferences();
  }

  Future<void> clearHistory() async {
    state = [];
    await _saveToPreferences();
  }

  Future<void> _saveToPreferences() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString(_key, json.encode(state));
    } catch (e) {
      //error
    }
  }
}

final movieDetailsProvider = FutureProvider.family<Movie?, int>((ref, movieId) async {
  if (movieId == 0) return null;
  
  final movieService = ref.read(movieServiceProvider);
  final result = await movieService.getMovieDetails(movieId);
  
  return result.fold(
    (failure) {
      // Return null on error
      return null;
    },
    (movie) => movie,
  );
});

final relatedMoviesProvider = FutureProvider.family<List<Movie>, int>((ref, movieId) async {
  if (movieId == 0) return <Movie>[];
  
  final movieService = ref.read(movieServiceProvider);
  final result = await movieService.getSimilarMovies(movieId);
  
  return result.fold(
    (failure) {
      // Return empty list on error
      return <Movie>[]; 
    },
    (response) => response.results ?? <Movie>[],
  );
});

final offlineCacheProvider = StateNotifierProvider<OfflineCacheNotifier, Map<String, dynamic>>((ref) {
  return OfflineCacheNotifier();
});

class OfflineCacheNotifier extends StateNotifier<Map<String, dynamic>> {
  OfflineCacheNotifier() : super({});

  static const String _cacheKey = 'movie_cache';

  Future<void> loadCache() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final cacheJson = prefs.getString(_cacheKey);
      if (cacheJson != null) {
        final Map<String, dynamic> cache = json.decode(cacheJson);
        state = cache;
      }
    } catch (e) {
      state = {};
    }
  }

  Future<void> saveToCache(String key, dynamic data) async {
    state = {...state, key: data};
    await _saveToPreferences();
  }

  dynamic getFromCache(String key) {
    return state[key];
  }

  Future<void> _saveToPreferences() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString(_cacheKey, json.encode(state));
    } catch (e) {
      // Handle error
    }
  }
}
