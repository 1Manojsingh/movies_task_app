import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';
import '../models/movie_model.dart';

class BookmarkState {
  final List<Movie> bookmarkedMovies;
  final bool isLoading;

  const BookmarkState({
    this.bookmarkedMovies = const [],
    this.isLoading = false,
  });

  BookmarkState copyWith({
    List<Movie>? bookmarkedMovies,
    bool? isLoading,
  }) {
    return BookmarkState(
      bookmarkedMovies: bookmarkedMovies ?? this.bookmarkedMovies,
      isLoading: isLoading ?? this.isLoading,
    );
  }
}

class BookmarkNotifier extends StateNotifier<BookmarkState> {
  BookmarkNotifier() : super(const BookmarkState()) {
    loadBookmarks();
  }

  static const String _bookmarkKey = 'bookmarked_movies';

  Future<void> loadBookmarks() async {
    state = state.copyWith(isLoading: true);
    
    try {
      final prefs = await SharedPreferences.getInstance();
      final bookmarksJson = prefs.getString(_bookmarkKey);
      
      if (bookmarksJson != null) {
        final List<dynamic> bookmarksList = json.decode(bookmarksJson);
        final bookmarks = bookmarksList
            .map((json) => Movie.fromJson(json))
            .toList();
        state = state.copyWith(
          bookmarkedMovies: bookmarks,
          isLoading: false,
        );
      } else {
        state = state.copyWith(isLoading: false);
      }
    } catch (e) {
      state = state.copyWith(isLoading: false);
    }
  }

  Future<void> toggleBookmark(Movie movie) async {
    final isBookmarked = state.bookmarkedMovies.any((m) => m.id == movie.id);
    
    List<Movie> updatedBookmarks;
    if (isBookmarked) {
      updatedBookmarks = state.bookmarkedMovies
          .where((m) => m.id != movie.id)
          .toList();
    } else {
      updatedBookmarks = [...state.bookmarkedMovies, movie];
    }

    state = state.copyWith(bookmarkedMovies: updatedBookmarks);
    await _saveBookmarks(updatedBookmarks);
  }

  bool isBookmarked(int movieId) {
    return state.bookmarkedMovies.any((movie) => movie.id == movieId);
  }

  Future<void> _saveBookmarks(List<Movie> bookmarks) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final bookmarksJson = json.encode(
        bookmarks.map((movie) => movie.toJson()).toList(),
      );
      await prefs.setString(_bookmarkKey, bookmarksJson);
    } catch (e) {
      // Handle error silently
    }
  }

  Future<void> clearAllBookmarks() async {
    state = const BookmarkState();
    try {
      final prefs = await SharedPreferences.getInstance();
      await prefs.remove(_bookmarkKey);
    } catch (e) {
      // Handle error silently
    }
  }
}

final bookmarkProvider = StateNotifierProvider<BookmarkNotifier, BookmarkState>((ref) {
  return BookmarkNotifier();
});

final isBookmarkedProvider = Provider.family<bool, int>((ref, movieId) {
  final bookmarkState = ref.watch(bookmarkProvider);
  return bookmarkState.bookmarkedMovies.any((movie) => movie.id == movieId);
});
