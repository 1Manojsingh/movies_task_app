// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i7;
import 'package:movie_task_app/features/account/views/account_page.dart' as _i1;
import 'package:movie_task_app/features/home/views/base_page.dart' as _i2;
import 'package:movie_task_app/features/home/views/home_page.dart' as _i3;
import 'package:movie_task_app/features/movies/views/account_page.dart' as _i4;
import 'package:movie_task_app/features/splash/views/splash_screen.dart' as _i5;
import 'package:movie_task_app/features/splash/views/welcome_page.dart' as _i6;

abstract class $AppRouter extends _i7.RootStackRouter {
  $AppRouter({super.navigatorKey});

  @override
  final Map<String, _i7.PageFactory> pagesMap = {
    AccountScreenRoute.name: (routeData) {
      return _i7.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i1.AccountScreenPage(),
      );
    },
    BaseRoute.name: (routeData) {
      return _i7.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i2.BasePage(),
      );
    },
    HomeScreenRoute.name: (routeData) {
      return _i7.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i3.HomeScreenPage(),
      );
    },
    MoviesScreenRoute.name: (routeData) {
      return _i7.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i4.MoviesScreenPage(),
      );
    },
    SplashScreenRoute.name: (routeData) {
      return _i7.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i5.SplashScreenPage(),
      );
    },
    WelcomeRoute.name: (routeData) {
      return _i7.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i6.WelcomePage(),
      );
    },
  };
}

/// generated route for
/// [_i1.AccountScreenPage]
class AccountScreenRoute extends _i7.PageRouteInfo<void> {
  const AccountScreenRoute({List<_i7.PageRouteInfo>? children})
      : super(
          AccountScreenRoute.name,
          initialChildren: children,
        );

  static const String name = 'AccountScreenRoute';

  static const _i7.PageInfo<void> page = _i7.PageInfo<void>(name);
}

/// generated route for
/// [_i2.BasePage]
class BaseRoute extends _i7.PageRouteInfo<void> {
  const BaseRoute({List<_i7.PageRouteInfo>? children})
      : super(
          BaseRoute.name,
          initialChildren: children,
        );

  static const String name = 'BaseRoute';

  static const _i7.PageInfo<void> page = _i7.PageInfo<void>(name);
}

/// generated route for
/// [_i3.HomeScreenPage]
class HomeScreenRoute extends _i7.PageRouteInfo<void> {
  const HomeScreenRoute({List<_i7.PageRouteInfo>? children})
      : super(
          HomeScreenRoute.name,
          initialChildren: children,
        );

  static const String name = 'HomeScreenRoute';

  static const _i7.PageInfo<void> page = _i7.PageInfo<void>(name);
}

/// generated route for
/// [_i4.MoviesScreenPage]
class MoviesScreenRoute extends _i7.PageRouteInfo<void> {
  const MoviesScreenRoute({List<_i7.PageRouteInfo>? children})
      : super(
          MoviesScreenRoute.name,
          initialChildren: children,
        );

  static const String name = 'MoviesScreenRoute';

  static const _i7.PageInfo<void> page = _i7.PageInfo<void>(name);
}

/// generated route for
/// [_i5.SplashScreenPage]
class SplashScreenRoute extends _i7.PageRouteInfo<void> {
  const SplashScreenRoute({List<_i7.PageRouteInfo>? children})
      : super(
          SplashScreenRoute.name,
          initialChildren: children,
        );

  static const String name = 'SplashScreenRoute';

  static const _i7.PageInfo<void> page = _i7.PageInfo<void>(name);
}

/// generated route for
/// [_i6.WelcomePage]
class WelcomeRoute extends _i7.PageRouteInfo<void> {
  const WelcomeRoute({List<_i7.PageRouteInfo>? children})
      : super(
          WelcomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'WelcomeRoute';

  static const _i7.PageInfo<void> page = _i7.PageInfo<void>(name);
}
