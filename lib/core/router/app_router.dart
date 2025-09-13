import 'package:auto_route/auto_route.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movie_task_app/features/account/views/account_page.dart';
import 'package:movie_task_app/features/home/views/home_page.dart';
import 'package:movie_task_app/features/movies/views/account_page.dart';

import 'app_router.gr.dart';

final routerProvider = Provider<AppRouter>((ref) {
  return AppRouter();
});

@AutoRouterConfig(replaceInRouteName: 'Page,Route')
class AppRouter extends $AppRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(page: SplashScreenRoute.page, initial: true),
        AutoRoute(page: WelcomeRoute.page),
        AutoRoute(page: WelcomeRoute.page),
        AutoRoute(page: BaseRoute.page),
        AutoRoute(page: HomeScreenRoute.page),
        AutoRoute(page: MoviesScreenRoute.page),
        AutoRoute(page: AccountScreenRoute.page),
      ];
}
