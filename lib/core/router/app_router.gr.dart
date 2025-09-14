// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i8;
import 'package:flutter/material.dart' as _i9;
import 'package:movie_task_app/features/account/views/account_page.dart' as _i1;
import 'package:movie_task_app/features/home/views/base_page.dart' as _i2;
import 'package:movie_task_app/features/home/views/home_page.dart' as _i3;
import 'package:movie_task_app/features/movies/views/movie_details_page.dart'
    as _i4;
import 'package:movie_task_app/features/movies/views/movies_page.dart' as _i5;
import 'package:movie_task_app/features/splash/views/splash_screen.dart' as _i6;
import 'package:movie_task_app/features/splash/views/welcome_page.dart' as _i7;

abstract class $AppRouter extends _i8.RootStackRouter {
  $AppRouter({super.navigatorKey});

  @override
  final Map<String, _i8.PageFactory> pagesMap = {
    AccountScreenRoute.name: (routeData) {
      return _i8.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i1.AccountScreenPage(),
      );
    },
    BaseRoute.name: (routeData) {
      return _i8.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i2.BasePage(),
      );
    },
    HomeScreenRoute.name: (routeData) {
      return _i8.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i3.HomeScreenPage(),
      );
    },
    MovieDetailsRoute.name: (routeData) {
      final pathParams = routeData.inheritedPathParams;
      final args = routeData.argsAs<MovieDetailsRouteArgs>(
          orElse: () =>
              MovieDetailsRouteArgs(movieId: pathParams.getInt('movieId')));
      return _i8.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i4.MovieDetailsPage(
          key: args.key,
          movieId: args.movieId,
        ),
      );
    },
    SearchMoviesScreen.name: (routeData) {
      return _i8.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i5.SearchMoviesScreen(),
      );
    },
    SplashScreenRoute.name: (routeData) {
      return _i8.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i6.SplashScreenPage(),
      );
    },
    WelcomeRoute.name: (routeData) {
      return _i8.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i7.WelcomePage(),
      );
    },
  };
}

/// generated route for
/// [_i1.AccountScreenPage]
class AccountScreenRoute extends _i8.PageRouteInfo<void> {
  const AccountScreenRoute({List<_i8.PageRouteInfo>? children})
      : super(
          AccountScreenRoute.name,
          initialChildren: children,
        );

  static const String name = 'AccountScreenRoute';

  static const _i8.PageInfo<void> page = _i8.PageInfo<void>(name);
}

/// generated route for
/// [_i2.BasePage]
class BaseRoute extends _i8.PageRouteInfo<void> {
  const BaseRoute({List<_i8.PageRouteInfo>? children})
      : super(
          BaseRoute.name,
          initialChildren: children,
        );

  static const String name = 'BaseRoute';

  static const _i8.PageInfo<void> page = _i8.PageInfo<void>(name);
}

/// generated route for
/// [_i3.HomeScreenPage]
class HomeScreenRoute extends _i8.PageRouteInfo<void> {
  const HomeScreenRoute({List<_i8.PageRouteInfo>? children})
      : super(
          HomeScreenRoute.name,
          initialChildren: children,
        );

  static const String name = 'HomeScreenRoute';

  static const _i8.PageInfo<void> page = _i8.PageInfo<void>(name);
}

/// generated route for
/// [_i4.MovieDetailsPage]
class MovieDetailsRoute extends _i8.PageRouteInfo<MovieDetailsRouteArgs> {
  MovieDetailsRoute({
    _i9.Key? key,
    required int movieId,
    List<_i8.PageRouteInfo>? children,
  }) : super(
          MovieDetailsRoute.name,
          args: MovieDetailsRouteArgs(
            key: key,
            movieId: movieId,
          ),
          rawPathParams: {'movieId': movieId},
          initialChildren: children,
        );

  static const String name = 'MovieDetailsRoute';

  static const _i8.PageInfo<MovieDetailsRouteArgs> page =
      _i8.PageInfo<MovieDetailsRouteArgs>(name);
}

class MovieDetailsRouteArgs {
  const MovieDetailsRouteArgs({
    this.key,
    required this.movieId,
  });

  final _i9.Key? key;

  final int movieId;

  @override
  String toString() {
    return 'MovieDetailsRouteArgs{key: $key, movieId: $movieId}';
  }
}

/// generated route for
/// [_i5.SearchMoviesScreen]
class SearchMoviesScreen extends _i8.PageRouteInfo<void> {
  const SearchMoviesScreen({List<_i8.PageRouteInfo>? children})
      : super(
          SearchMoviesScreen.name,
          initialChildren: children,
        );

  static const String name = 'SearchMoviesScreen';

  static const _i8.PageInfo<void> page = _i8.PageInfo<void>(name);
}

/// generated route for
/// [_i6.SplashScreenPage]
class SplashScreenRoute extends _i8.PageRouteInfo<void> {
  const SplashScreenRoute({List<_i8.PageRouteInfo>? children})
      : super(
          SplashScreenRoute.name,
          initialChildren: children,
        );

  static const String name = 'SplashScreenRoute';

  static const _i8.PageInfo<void> page = _i8.PageInfo<void>(name);
}

/// generated route for
/// [_i7.WelcomePage]
class WelcomeRoute extends _i8.PageRouteInfo<void> {
  const WelcomeRoute({List<_i8.PageRouteInfo>? children})
      : super(
          WelcomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'WelcomeRoute';

  static const _i8.PageInfo<void> page = _i8.PageInfo<void>(name);
}
