// import 'package:auto_route/auto_route.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_downloader/flutter_downloader.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:task_pay/core/isolates/download_isolate.dart';
// import 'package:task_pay/core/providers/is_downloading_provider.dart';
// import 'package:task_pay/features/home/providers/bottom_nav_index.dart';
// import 'package:task_pay/features/home/views/home_page.dart';
// import 'package:task_pay/features/project_creator/views/project_view.dart';
// import 'package:task_pay/features/transactions/views/transaction_page.dart';
//
// import '../../auth/repositories/auth_repository.dart';
// import '../widgets/app_bottom_navbar.dart';
// import 'feed_page/feed_page.dart';
//
// @RoutePage()
// class BasePage extends ConsumerStatefulWidget {
//   const BasePage({super.key});
//
//   @override
//   ConsumerState<BasePage> createState() => _BasePageState();
// }
//
// class _BasePageState extends ConsumerState<BasePage> with WidgetsBindingObserver{
//   late int selectedIndex;
//   final _bucket = PageStorageBucket();
//   late DownloadTaskStatus status;
//
//   @override
//   void initState() {
//     super.initState();
//     DownloadIsolate.bindBackgroundIsolate(updateProgress: (data) {
//       String id = data[0];
//       debugPrint("ID:::::: $id");
//       status = DownloadTaskStatus.fromInt(data[1]);
//       if (status == DownloadTaskStatus.enqueued ||
//           status == DownloadTaskStatus.running) {
//         ref.read(downloadStatusProvider.notifier).setData(true);
//       } else if (status == DownloadTaskStatus.complete) {
//         ref.read(downloadStatusProvider.notifier).setData(false);
//       } else {
//         ref.read(downloadStatusProvider.notifier).setData(false);
//       }
//       debugPrint("PROGRESS:::::::: ${data[2]}");
//     });
//     WidgetsBinding.instance.addObserver(this);
//     ref.read(authRepositoryProvider).setStatus(true);
//   }
//
//   @override
//   void dispose() {
//     DownloadIsolate.unbindBackgroundIsolate();
//     ref.read(authRepositoryProvider).setStatus(false);
//     WidgetsBinding.instance.removeObserver(this);
//     super.dispose();
//   }
//
//   @override
//   void didChangeAppLifecycleState(AppLifecycleState state) {
//     if (state == AppLifecycleState.resumed) {
//       ref.read(authRepositoryProvider).setStatus(true);
//     } else {
//       ref.read(authRepositoryProvider).setStatus(false);
//     }
//   }
//
//
//
//   @override
//   Widget build(BuildContext context) {
//     selectedIndex = ref.watch(bottomNavIndexProvider);
//     final pages = [
//       const HomePage(),
//       const TransactionsPage(),
//       const ProjectPage(),
//       const FeedPage(),
//     ];
//     return Scaffold(
//       body: PageStorage(
//         bucket: _bucket,
//         child: pages[selectedIndex],
//       ),
//       bottomNavigationBar: AppBottomNavBar(
//         onPageChanged: (index) =>
//             ref.read(bottomNavIndexProvider.notifier).update((state) => index),
//         selectedPage: selectedIndex,
//       ),
//     );
//   }
//
//
// }
