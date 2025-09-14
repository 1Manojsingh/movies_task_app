import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movie_task_app/core/router/app_router.gr.dart';
import 'package:movie_task_app/core/widgets/app_padding.dart';
import 'package:movie_task_app/features/movies/providers/paginated_movie_providers.dart';
import '../../../core/theme/text_theme.dart';
import '../../../core/utility/design_utility.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/utility/image_utils.dart';

@RoutePage()
class HomeScreenPage extends ConsumerStatefulWidget {
  const HomeScreenPage({super.key});

  @override
  ConsumerState<HomeScreenPage> createState() => _HomeScreenPageState();
}

class _HomeScreenPageState extends ConsumerState<HomeScreenPage> {
  static const Map<String, dynamic> _trendingParams = {
    'timeWindow': 'day',
    'language': 'en-US',
  };
  
  static const Map<String, dynamic> _nowPlayingParams = {
    'language': 'en-US',
  };

  final ScrollController _trendingScrollController = ScrollController();
  final ScrollController _nowPlayingScrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(paginatedTrendingMoviesProvider(_trendingParams).notifier).loadInitial();
      ref.read(paginatedNowPlayingMoviesProvider(_nowPlayingParams).notifier).loadInitial();
    });
    _trendingScrollController.addListener(_onTrendingScroll);
    _nowPlayingScrollController.addListener(_onNowPlayingScroll);
  }

  @override
  void dispose() {
    _trendingScrollController.dispose();
    _nowPlayingScrollController.dispose();
    super.dispose();
  }

  void _onTrendingScroll() {
    if (_trendingScrollController.position.pixels >=
        _trendingScrollController.position.maxScrollExtent - 200) {
      final state = ref.read(paginatedTrendingMoviesProvider(_trendingParams));
      if (state.hasMore && !state.isLoading) {
        ref.read(paginatedTrendingMoviesProvider(_trendingParams).notifier).loadMore();
      }
    }
  }

  void _onNowPlayingScroll() {
    if (_nowPlayingScrollController.position.pixels >=
        _nowPlayingScrollController.position.maxScrollExtent - 200) {
      final state = ref.read(paginatedNowPlayingMoviesProvider(_nowPlayingParams));
      if (state.hasMore && !state.isLoading) {
        ref.read(paginatedNowPlayingMoviesProvider(_nowPlayingParams).notifier).loadMore();
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final trendingMoviesState = ref.watch(paginatedTrendingMoviesProvider(_trendingParams));
    final nowPlayingMoviesState = ref.watch(paginatedNowPlayingMoviesProvider(_nowPlayingParams));

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Movie App',
          style: appTextTheme.headlineMedium?.copyWith(color: Colors.white),
        ),
        backgroundColor: Colors.black,
        foregroundColor: Colors.white,
        actions: [
          IconButton(
            onPressed: () {
              ref.read(paginatedTrendingMoviesProvider(_trendingParams).notifier).loadInitial();
              ref.read(paginatedNowPlayingMoviesProvider(_nowPlayingParams).notifier).loadInitial();
            },
            icon: const Icon(Icons.refresh,),
            tooltip: 'Reload Movies',
          ),
        ],
      ),
      backgroundColor: Colors.black,
      body: DefaultAppPadding(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildSectionHeader('Trending Movies (Today)', trendingMoviesState),
              verticalSpaceRegular,
              _buildMovieList(
                trendingMoviesState,
                () => ref.read(paginatedTrendingMoviesProvider(_trendingParams).notifier).loadMore(),
                isTrending: true,
                scrollController: _trendingScrollController,
              ),
              verticalSpaceMedium,
              _buildSectionHeader('Now Playing Movies', nowPlayingMoviesState),
              verticalSpaceRegular,
              _buildMovieList(
                nowPlayingMoviesState,
                () => ref.read(paginatedNowPlayingMoviesProvider(_nowPlayingParams).notifier).loadMore(),
                isTrending: false,
                scrollController: _nowPlayingScrollController,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSectionHeader(String title, PaginatedMovieState state) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: appTextTheme.titleMedium?.copyWith(
            color: Colors.white,
          ),
        ),
        if (state.movies.isNotEmpty)
          Text(
            '${state.movies.length}/${state.totalResults}',
            style: appTextTheme.bodySmall?.copyWith(
              color: AppColors.secondary,
            ),
          ),
      ],
    );
  }

  Widget _buildMovieList(PaginatedMovieState state, VoidCallback onLoadMore, {bool isTrending = false, ScrollController? scrollController}) {
    if (state.error != null) {
      return const SizedBox(
        height: 280,
        child: Center(
          child: CircularProgressIndicator(color: AppColors.orangeColor),
        ),
      );
    }

    if (state.movies.isEmpty && state.isLoading) {
      return const SizedBox(
        height: 280,
        child: Center(
          child: CircularProgressIndicator(color: AppColors.orangeColor),
        ),
      );
    }

    if (state.movies.isEmpty && !state.isLoading) {
      return const SizedBox(
        height: 280,
        child: Center(
          child: CircularProgressIndicator(color: AppColors.orangeColor),
        ),
      );
    }

    return Column(
      children: [
        SizedBox(
          height: 280,
          child: ListView.builder(
            controller: scrollController,
            scrollDirection: Axis.horizontal,
            itemCount: state.movies.length + (state.isLoading ? 1 : 0),
            itemBuilder: (context, index) {
              if (index == state.movies.length && state.isLoading) {
                return Container(
                  width: 150,
                  margin: const EdgeInsets.only(right: 10),
                  child: const Center(
                    child: CircularProgressIndicator(color: AppColors.orangeColor),
                  ),
                );
              }
              final movie = state.movies[index];
              return GestureDetector(
                onTap: () {
                  context.router.push(MovieDetailsRoute(movieId: movie.id ??0 ));
                },
                child: Container(
                  width: 150,
                  margin: const EdgeInsets.only(right: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: Image.network(
                          ImageUtils.buildPosterUrl(movie.posterPath) ?? '',
                          height: 200,
                          width: 150,
                          fit: BoxFit.cover,
                          errorBuilder: (context, error, stackTrace) {
                            return Container(
                              height: 200,
                              width: 150,
                              color: Colors.grey[800],
                              child: const Icon(Icons.movie, color: Colors.grey),
                            );
                          },
                        ),
                      ),
                    verticalSpaceSmall,
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            movie.title ?? 'Unknown',
                            style: appTextTheme.bodySmall?.copyWith(
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                          verticalSpaceTiny,
                          Text(
                            'Rating: ${movie.voteAverage?.toStringAsFixed(1) ?? 'N/A'}',
                            style: appTextTheme.bodySmall?.copyWith(
                              color: Colors.grey[400],
                              fontSize: 11,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                ),
              );
            },
          ),
        ),
        verticalSpaceSmall,
        if (!state.hasMore && state.movies.isNotEmpty)
          Center(
            child: Text(
              'All movies loaded (${state.totalResults} total)',
              style: appTextTheme.bodySmall?.copyWith(color: Colors.grey[400]),
            ),
          ),
      ],
    );
  }
}