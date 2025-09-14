import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movie_task_app/core/widgets/app_padding.dart';
import '../../../core/utility/image_utils.dart';
import '../../movies/providers/bookmark_provider.dart';
import '../../movies/models/movie_model.dart';
import '../../../core/theme/text_theme.dart';
import '../../../core/utility/design_utility.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/router/app_router.gr.dart';
import '../../../core/utility/app_utiles.dart';

@RoutePage()
class AccountScreenPage extends ConsumerWidget {
  const AccountScreenPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final bookmarkState = ref.watch(bookmarkProvider);

    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: DefaultAppPadding(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildProfileSection(),
                verticalSpaceLarge,
                _buildSavedMoviesSection(context, ref, bookmarkState),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildProfileSection() {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.grey[900],
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          Container(
            width: 80,
            height: 80,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              gradient: LinearGradient(
                colors: [
                  AppColors.orangeColor,
                  AppColors.primary,
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
            child: const Icon(
              Icons.person,
              color: Colors.white,
              size: 40,
            ),
          ),
          horizontalSpaceRegular,
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'John Doe',
                  style: appTextTheme.headlineMedium?.copyWith(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                verticalSpaceTiny,
                Text(
                  'Movie Enthusiast',
                  style: appTextTheme.bodyMedium?.copyWith(
                    color: Colors.grey[400],
                  ),
                ),
                verticalSpaceSmall,
                Text(
                  'john.doe@example.com',
                  style: appTextTheme.bodySmall?.copyWith(
                    color: Colors.grey[500],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSavedMoviesSection(BuildContext context, WidgetRef ref, BookmarkState bookmarkState) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Saved Movies',
              style: appTextTheme.headlineMedium?.copyWith(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            if (bookmarkState.bookmarkedMovies.isNotEmpty)
              TextButton(
                onPressed: () {
                  ref.read(bookmarkProvider.notifier).clearAllBookmarks();
                },
                child: Text(
                  'Clear All',
                  style: appTextTheme.bodySmall?.copyWith(
                    color: AppColors.orangeColor,
                  ),
                ),
              ),
          ],
        ),
        verticalSpaceRegular,
        
        if (bookmarkState.isLoading)
          const Center(
            child: CircularProgressIndicator(color: AppColors.orangeColor),
          )
        else if (bookmarkState.bookmarkedMovies.isEmpty)
          _buildEmptyState()
        else
          _buildSavedMoviesList(context, bookmarkState.bookmarkedMovies),
      ],
    );
  }

  Widget _buildEmptyState() {
    return Container(
      padding: const EdgeInsets.all(40),
      child: Column(
        children: [
          Icon(
            Icons.bookmark_border,
            color: Colors.grey[600],
            size: 64,
          ),
          verticalSpaceRegular,
          Text(
            'No saved movies yet',
            style: appTextTheme.titleMedium?.copyWith(
              color: Colors.grey[400],
            ),
          ),
          verticalSpaceSmall,
          Text(
            'Bookmark movies you like to see them here',
            style: appTextTheme.bodyMedium?.copyWith(
              color: Colors.grey[600],
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  Widget _buildSavedMoviesList(BuildContext context, List<Movie> movies) {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: movies.length,
      itemBuilder: (context, index) {
        final movie = movies[index];
        return _buildSavedMovieCard(context, movie);
      },
    );
  }

  Widget _buildSavedMovieCard(BuildContext context, Movie movie) {
    return GestureDetector(
      onTap: () {
        context.router.push(MovieDetailsRoute(movieId: movie.id ?? 0));
      },
      child: Container(
        margin: const EdgeInsets.only(bottom: 12),
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: Colors.grey[900],
          borderRadius: BorderRadius.circular(8),
        ),
        child: Row(
          children: [
            // Movie Poster
            ClipRRect(
              borderRadius: BorderRadius.circular(6),
              child: Image.network(
                ImageUtils.buildPosterUrl(movie.posterPath) ?? '',
                height: 80,
                width: 60,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  return Container(
                    height: 80,
                    width: 60,
                    color: Colors.grey[800],
                    child: const Icon(Icons.movie, color: Colors.grey),
                  );
                },
              ),
            ),
            horizontalSpaceRegular,
            
            // Movie Info
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
                  verticalSpaceTiny,
                  Text(
                    movie.overview ?? '',
                    style: appTextTheme.bodySmall?.copyWith(
                      color: Colors.grey[400],
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  verticalSpaceTiny,
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
                        style: appTextTheme.bodySmall?.copyWith(color: Colors.grey[500]),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            
            // Bookmark Icon
            Consumer(
              builder: (context, ref, child) {
                return IconButton(
                  onPressed: () {
                    ref.read(bookmarkProvider.notifier).toggleBookmark(movie);
                  },
                  icon: const Icon(
                    Icons.bookmark,
                    color: AppColors.orangeColor,
                    size: 24,
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
