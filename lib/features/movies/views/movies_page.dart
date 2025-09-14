import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'dart:async';
import '../../../core/utility/image_utils.dart';
import '../providers/search_providers.dart';
import '../models/movie_model.dart';
import '../../../core/theme/text_theme.dart';
import '../../../core/utility/design_utility.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/router/app_router.gr.dart';
import '../../../core/utility/app_utiles.dart';

@RoutePage()
class SearchMoviesScreen extends ConsumerStatefulWidget {
  const SearchMoviesScreen({super.key});

  @override
  ConsumerState<SearchMoviesScreen> createState() => _SearchMoviesScreenState();
}

class _SearchMoviesScreenState extends ConsumerState<SearchMoviesScreen> {
  final TextEditingController _searchController = TextEditingController();
  Timer? _debounceTimer;

  @override
  void initState() {
    super.initState();
    ref.read(searchHistoryProvider.notifier).loadRecentSearches();
  }

  @override
  void dispose() {
    _searchController.dispose();
    _debounceTimer?.cancel();
    super.dispose();
  }

  void _onSearchChanged(String query) {
    ref.read(searchQueryProvider.notifier).state = query;
    
    _debounceTimer?.cancel();
    _debounceTimer = Timer(const Duration(milliseconds: 500), () {
      if (query.isNotEmpty) {
        ref.read(searchHistoryProvider.notifier).addToHistory(query);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final searchQuery = ref.watch(searchQueryProvider);
    final searchResults = ref.watch(searchMoviesProvider(searchQuery));
    final recentSearches = ref.watch(searchHistoryProvider);

    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildSearchBar(),
              verticalSpaceMoreThanRegular,
              
              if (searchQuery.isEmpty) ...[
                _buildRecentSearches(recentSearches),
              ] else ...[
                _buildSearchResults(searchResults),
              ],
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSearchBar() {
    return Container(
      height: 50,
      decoration: BoxDecoration(
        color: Colors.grey[900],
        borderRadius: BorderRadius.circular(25),
      ),
      child: Row(
        children: [
          IconButton(
            onPressed: () => context.router.maybePop(),
            icon: const Icon(Icons.arrow_back, color: Colors.white),
          ),
          Expanded(
            child: TextField(
              controller: _searchController,
              onChanged: _onSearchChanged,
              style: const TextStyle(color: Colors.white),
              decoration: const InputDecoration(
                hintText: 'Search any movies name here',
                hintStyle: TextStyle(color: Colors.grey),
                border: InputBorder.none,
                contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              ),
            ),
          ),
          IconButton(
            onPressed: () {
              // Filter functionality
            },
            icon: const Icon(Icons.tune, color: Colors.white),
          ),
        ],
      ),
    );
  }

  Widget _buildRecentSearches(List<String> recentSearches) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Recent search',
          style: appTextTheme.headlineMedium?.copyWith(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        verticalSpaceRegular,
        SizedBox(
          height: 200,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: recentSearches.length,
            itemBuilder: (context, index) {
              final searchTerm = recentSearches[index];
              return GestureDetector(
                onTap: () {
                  _searchController.text = searchTerm;
                  _onSearchChanged(searchTerm);
                },
                child: Container(
                  width: 120,
                  margin: const EdgeInsets.only(right: 12),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        height: 150,
                        decoration: BoxDecoration(
                          color: Colors.grey[800],
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: const Center(
                          child: Icon(
                            Icons.history,
                            color: Colors.grey,
                            size: 40,
                          ),
                        ),
                      ),
                      verticalSpaceSmall,
                      Text(
                        searchTerm,
                        style: appTextTheme.bodySmall?.copyWith(
                          color: Colors.white,
                        ),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  Widget _buildSearchResults(AsyncValue<List<Movie>> searchResults) {
    return Expanded(
      child: searchResults.when(
        data: (movies) => movies.isEmpty
            ? const Center(
                child: CircularProgressIndicator(color: AppColors.orangeColor),
              )
            : ListView.builder(
                itemCount: movies.length,
                itemBuilder: (context, index) {
                  final movie = movies[index];
                  return _buildMovieCard(movie);
                },
              ),
        loading: () => const Center(
          child: CircularProgressIndicator(color: AppColors.orangeColor),
        ),
        error: (error, stack) => const Center(
          child: CircularProgressIndicator(color: AppColors.orangeColor),
        ),
      ),
    );
  }

  Widget _buildMovieCard(Movie movie) {
    return GestureDetector(
      onTap: () {
        context.router.push(MovieDetailsRoute(movieId: movie.id ?? 0));
      },
      child: Container(
        margin: const EdgeInsets.only(bottom: 16),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.network(
                ImageUtils.buildPosterUrl(movie.posterPath) ?? '',
                height: 120,
                width: 80,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  return Container(
                    height: 120,
                    width: 80,
                    color: Colors.grey[800],
                    child: const Icon(Icons.movie, color: Colors.grey),
                  );
                },
              ),
            ),
            horizontalSpaceRegular,
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    movie.title ?? 'Unknown',
                    style: appTextTheme.titleMedium?.copyWith(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  verticalSpaceSmall,
                  Text(
                    movie.overview ?? '',
                    style: appTextTheme.bodyMedium?.copyWith(
                      color: Colors.grey[400],
                    ),
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                  ),
                  verticalSpaceSmall,
                  Row(
                    children: [
                      const Icon(Icons.star, color: AppColors.orangeColor, size: 16),
                      horizontalSpaceTiny,
                      Text(
                        '${movie.voteAverage?.toStringAsFixed(1) ?? 'N/A'}',
                        style: appTextTheme.bodySmall?.copyWith(color: Colors.white),
                      ),
                      horizontalSpaceRegular,
                      Text(
                        AppUtils.getYear(movie.releaseDate),
                        style: appTextTheme.bodySmall?.copyWith(color: Colors.grey[400]),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
