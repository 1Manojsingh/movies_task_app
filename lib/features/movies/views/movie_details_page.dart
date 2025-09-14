import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movie_task_app/core/widgets/app_padding.dart';
import '../../../core/utility/image_utils.dart';
import '../providers/search_providers.dart';
import '../providers/bookmark_provider.dart';
import '../models/movie_model.dart';
import '../../../core/theme/text_theme.dart';
import '../../../core/utility/design_utility.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/utility/app_utiles.dart';

@RoutePage()
class MovieDetailsPage extends ConsumerStatefulWidget {
  final int movieId;

  const MovieDetailsPage({super.key, required this.movieId});

  @override
  ConsumerState<MovieDetailsPage> createState() => _MovieDetailsPageState();
}

class _MovieDetailsPageState extends ConsumerState<MovieDetailsPage> {
  bool _isExpanded = false;

  @override
  Widget build(BuildContext context) {
    final movieDetails = ref.watch(movieDetailsProvider(widget.movieId));
    final relatedMovies = ref.watch(relatedMoviesProvider(widget.movieId));

    return Scaffold(
      backgroundColor: Colors.black,
      body: movieDetails.when(
        data: (movie) {
          if (movie == null) {
            return Center(
              child: Text(
                'Movie not found',
                style: appTextTheme.titleMedium?.copyWith(color: Colors.white),
              ),
            );
          }
          return _buildMovieDetails(context, movie, relatedMovies);
        },
        loading: () => const Center(
          child: CircularProgressIndicator(color: AppColors.orangeColor),
        ),
        error: (error, stack) => const Center(
          child: CircularProgressIndicator(color: AppColors.orangeColor),
        ),
      ),
    );
  }

  Widget _buildMovieDetails(BuildContext context, Movie movie,
      AsyncValue<List<Movie>> relatedMovies) {
    return CustomScrollView(
      slivers: [
        SliverAppBar(
          expandedHeight: 400,
          pinned: true,
          backgroundColor: Colors.black,
          leading: IconButton(
            onPressed: () => context.router.maybePop(),
            icon: const Icon(Icons.arrow_back, color: Colors.white),
          ),
          actions: [
            Consumer(
              builder: (context, ref, child) {
                final isBookmarked =
                    ref.watch(isBookmarkedProvider(widget.movieId));
                return IconButton(
                  onPressed: () {
                    ref.read(bookmarkProvider.notifier).toggleBookmark(movie);
                  },
                  icon: Icon(
                    isBookmarked ? Icons.bookmark : Icons.bookmark_border,
                    color: isBookmarked ? AppColors.orangeColor : Colors.white,
                    size: 28,
                  ),
                );
              },
            ),
          ],
          flexibleSpace: FlexibleSpaceBar(
            background: Stack(
              fit: StackFit.expand,
              children: [
                Image.network(
                  ImageUtils.buildBackdropUrl(movie.backdropPath) ?? '',
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) {
                    return Container(
                      color: Colors.grey[800],
                      child: const Center(
                        child: Icon(Icons.movie, color: Colors.grey, size: 100),
                      ),
                    );
                  },
                ),
                Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Colors.transparent,
                        Colors.black.withOpacity(0.7),
                      ],
                    ),
                  ),
                ),
                Center(
                  child: Container(
                    decoration: const BoxDecoration(
                      color: Colors.orange,
                      shape: BoxShape.circle,
                    ),
                    child: IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.play_arrow,
                        color: Colors.white,
                        size: 40,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        SliverToBoxAdapter(
          child: DefaultAppPadding(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Text(
                        movie.title ?? 'Unknown',
                        style: appTextTheme.headlineMedium?.copyWith(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 8, vertical: 4),
                      decoration: BoxDecoration(
                        color: AppColors.thirdColor,
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: Text(
                        '4K',
                        style: appTextTheme.bodySmall?.copyWith(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
                verticalSpaceTiny,
                Row(
                  children: [
                    const Icon(Icons.access_time, color: Colors.grey, size: 16),
                    horizontalSpaceTiny,
                    Text(
                      '${AppUtils.getDuration(movie.runtime)} minutes',
                      style:
                          appTextTheme.bodySmall?.copyWith(color: Colors.grey),
                    ),
                    horizontalSpaceRegular,
                    const Icon(Icons.star, color: Colors.orange, size: 16),
                    horizontalSpaceTiny,
                    Text(
                      '${movie.voteAverage?.toStringAsFixed(1) ?? 'N/A'} (IMDb)',
                      style:
                          appTextTheme.bodySmall?.copyWith(color: Colors.white),
                    ),
                  ],
                ),
                verticalSpaceRegular,
                _buildInfoSection(
                  'Release date',
                  AppUtils.formatDate(movie.releaseDate),
                ),
                verticalSpaceRegular,
                _buildSynopsisSection(
                    movie.overview ?? 'No synopsis available.'),
                verticalSpaceRegular,
                relatedMovies.when(
                  data: (movies) {
                    if (movies.isEmpty) {
                      return const SizedBox.shrink();
                    }
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Related Movies',
                          style: appTextTheme.headlineMedium?.copyWith(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        verticalSpaceRegular,
                        _buildRelatedMoviesList(movies),
                      ],
                    );
                  },
                  loading: () => const SizedBox.shrink(),
                  error: (_, __) => const SizedBox.shrink(),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildSynopsisSection(String content) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Synopsis',
          style: appTextTheme.titleMedium?.copyWith(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        verticalSpaceSmall,
        Text(
          _isExpanded
              ? content
              : content.length > 70
                  ? '${content.substring(0, 70)}...'
                  : content,
          style: appTextTheme.bodySmall?.copyWith(
            color: AppColors.thirdColor,
          ),
        ),
        if (content.length > 150)
          InkWell(
            onTap: () {
              setState(() {
                _isExpanded = !_isExpanded;
              });
            },
            child: Text(
              _isExpanded ? 'Read less' : 'Read more',
              style: appTextTheme.bodySmall?.copyWith(
                fontSize: 14,
                decoration: TextDecoration.underline,
                color: AppColors.orangeColor,
                fontWeight: FontWeight.w700,
              ),
            ),
          )
      ],
    );
  }

  Widget _buildInfoSection(String title, String content,
      {bool isExpandable = false}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: appTextTheme.titleMedium?.copyWith(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        verticalSpaceSmall,
        Text(
          content,
          style: appTextTheme.bodyMedium?.copyWith(
            color: Colors.grey[300],
          ),
          maxLines: isExpandable ? 3 : null,
          overflow: isExpandable ? TextOverflow.ellipsis : null,
        ),
      ],
    );
  }

  Widget _buildRelatedMoviesList(List<Movie> movies) {
    return SizedBox(
      height: 200,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: movies.length,
        itemBuilder: (context, index) {
          final relatedMovie = movies[index];
          return _buildRelatedMovieCard(context, relatedMovie);
        },
      ),
    );
  }

  Widget _buildRelatedMovieCard(BuildContext context, Movie movie) {
    return Container(
      width: 120,
      margin: const EdgeInsets.only(right: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Image.network(
              ImageUtils.buildPosterUrl(movie.posterPath) ?? '',
              width: 120,
              height: 160,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) {
                return Container(
                  width: 120,
                  height: 160,
                  color: Colors.grey[800],
                  child: const Icon(Icons.movie, color: Colors.grey),
                );
              },
            ),
          ),
          verticalSpaceTiny,
          Text(
            movie.title ?? 'Unknown',
            style: appTextTheme.bodySmall?.copyWith(
              color: Colors.white,
              fontWeight: FontWeight.w500,
            ),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }
}
