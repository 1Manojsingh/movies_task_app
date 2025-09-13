import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movie_task_app/features/movies/views/account_page.dart';
import '../../account/views/account_page.dart';
import '../providers/bottom_nav_index.dart';
import '../widgets/app_bottom_navbar.dart';
import 'home_page.dart';

@RoutePage()
class BasePage extends ConsumerStatefulWidget {
  const BasePage({super.key});

  @override
  ConsumerState<BasePage> createState() => _BasePageState();
}

class _BasePageState extends ConsumerState<BasePage> with WidgetsBindingObserver{
  late int selectedIndex;
  final _bucket = PageStorageBucket();


  @override
  Widget build(BuildContext context) {
    selectedIndex = ref.watch(bottomNavIndexProvider);
    final pages = [
      const HomeScreenPage(),
      const MoviesScreenPage(),
      const AccountScreenPage(),
    ];
    return Scaffold(
      body: PageStorage(
        bucket: _bucket,
        child: pages[selectedIndex],
      ),
      bottomNavigationBar: AppBottomNavBar(
        onPageChanged: (index) =>
            ref.read(bottomNavIndexProvider.notifier).update((state) => index),
        selectedPage: selectedIndex,
      ),
    );
  }


}
