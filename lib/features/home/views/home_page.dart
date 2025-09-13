// import 'dart:developer';
//
// import 'package:auto_route/auto_route.dart';
// import 'package:custom_refresh_indicator/custom_refresh_indicator.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:flutter_svg/svg.dart';
// import 'package:intl/intl.dart';
// import 'package:rive/rive.dart';
// import 'package:task_pay/core/constants/paths.dart';
// import 'package:task_pay/core/extensions/num_extension.dart';
// import 'package:task_pay/core/providers/prefs_provider.dart';
// import 'package:task_pay/core/router/app_router.dart';
// import 'package:task_pay/core/theme/app_colors.dart';
// import 'package:task_pay/core/utilities/app_utility.dart';
// import 'package:task_pay/core/utilities/design_utility.dart';
// import 'package:task_pay/core/wigdets/app_padding.dart';
// import 'package:task_pay/core/wigdets/filter_button.dart';
// import 'package:task_pay/core/wigdets/loader_widget.dart';
// import 'package:task_pay/core/wigdets/project_card.dart';
// import 'package:task_pay/features/account/providers/financial_provider.dart';
// import 'package:task_pay/features/home/providers/bottom_nav_index.dart';
// import 'package:task_pay/features/home/providers/home_projects_provider.dart';
// import 'package:task_pay/features/home/widgets/primary_header.dart';
// import 'package:task_pay/features/home/widgets/transaction_item.dart';
// import 'package:task_pay/features/milestones/models/milestone.dart';
// import 'package:task_pay/features/milestones/models/pagination_request.dart';
// import 'package:task_pay/features/milestones/providers/user_milestones_provider.dart';
// import 'package:task_pay/features/milestones/providers/user_transactions_provider.dart';
// import '../../../core/constants/shared_pref_keys.dart';
// import '../../../core/providers/avatar_provider.dart';
//
// class HomePage extends ConsumerStatefulWidget {
//   const HomePage({super.key});
//
//   @override
//   ConsumerState<HomePage> createState() => _HomePageState();
// }
//
// class _HomePageState extends ConsumerState<HomePage> {
//   String projectStatus = 'all';
//   bool? milestoneStatus;
//
//   @override
//   void initState() {
//     ref.read(avatarProvider);
//     ref.read(financialProvider);
//     WidgetsBinding.instance.addPostFrameCallback(
//             (duration) {
//           ref.invalidate(userMilestonesProvider);
//           ref.invalidate(userTransactionsProvider);
//           ref.invalidate(homeProjectsProvider);
//         }
//     );
//     super.initState();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//  String? token= ref.read(prefsProvider).getString(PrefKeys.accessToken);
//  log(token ?? "");
//     return SafeArea(
//       child: Column(
//         children: [
//           const PrimaryHeader(),
//           verticalSpaceRegular,
//           Expanded(
//             child: AppRefreshLoader(
//               child: SingleChildScrollView(
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     DefaultAppPadding.horizontal(
//                       child: SectionHeader(
//                         title: "Milestones",
//                         buttonText: "View All",
//                         onButtonPressed: () {
//                           ref
//                               .read(bottomNavIndexProvider.notifier)
//                               .update((state) => 2);
//                         },
//                       ),
//                     ),
//                     verticalSpaceRegular,
//                     DefaultAppPadding.horizontal(
//                       child: Wrap(
//                         spacing: 10,
//                         children: [
//                           FilterButton(
//                               name: "All",
//                               isSelected: milestoneStatus == null,
//                               onPressed: () {
//                                 setState(() {
//                                   milestoneStatus = null;
//                                 });
//                                 ref.invalidate(userMilestonesProvider);
//                               }),
//                           FilterButton(
//                               name: "Active",
//                               isSelected: milestoneStatus == true,
//                               onPressed: () {
//                                 setState(() {
//                                   milestoneStatus = true;
//                                 });
//                                 ref.invalidate(userMilestonesProvider);
//                               }),
//                           FilterButton(
//                               name: "Inactive",
//                               isSelected: milestoneStatus == false,
//                               onPressed: () {
//                                 setState(() {
//                                   milestoneStatus = false;
//                                 });
//                                 ref.invalidate(userMilestonesProvider);
//                               }),
//                         ],
//                       ),
//                     ),
//                     verticalSpaceRegular,
//                     Milestones(active: milestoneStatus),
//                     verticalSpaceSemiLarge,
//                     DefaultAppPadding.horizontal(
//                       child: Column(
//                         children: [
//                           SectionHeader(
//                             title: "Transactions",
//                             buttonText: "View All",
//                             onButtonPressed: () {
//                               ref
//                                   .read(bottomNavIndexProvider.notifier)
//                                   .update((state) => 1);
//                             },
//                           ),
//                           verticalSpaceMedium,
//                           const Transactions(),
//                           verticalSpaceSemiLarge,
//                           SectionHeader(
//                             title: "Projects",
//                             buttonText: "View All",
//                             onButtonPressed: () {
//                               ref
//                                   .read(bottomNavIndexProvider.notifier)
//                                   .update((state) => 2);
//                             },
//                           ),
//                           verticalSpaceRegular,
//                           Align(
//                             alignment: Alignment.centerLeft,
//                             child: Wrap(
//                               spacing: 10,
//                               children: [
//                                 FilterButton(
//                                     name: "All",
//                                     isSelected: projectStatus == 'all',
//                                     onPressed: () {
//                                       setState(() {
//                                         projectStatus = 'all';
//                                       });
//                                       ref.invalidate(homeProjectsProvider);
//                                     }),
//                                 FilterButton(
//                                     name: "In progress",
//                                     isSelected: projectStatus == 'inprogress',
//                                     onPressed: () {
//                                       setState(() {
//                                         projectStatus = 'inprogress';
//                                       });
//                                       ref.invalidate(homeProjectsProvider);
//                                     }),
//                                 FilterButton(
//                                     name: "Completed",
//                                     isSelected: projectStatus == 'completed',
//                                     onPressed: () {
//                                       setState(() {
//                                         projectStatus = 'completed';
//                                       });
//                                       ref.invalidate(homeProjectsProvider);
//                                     }),
//                               ],
//                             ),
//                           ),
//                           verticalSpaceRegular,
//                         ],
//                       ),
//                     ),
//                     Projects(status: projectStatus),
//                     // const MilestonesAsProjects(),
//                     verticalSpaceSemiLarge,
//                   ],
//                 ),
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
//
// class Milestones extends ConsumerWidget {
//   const Milestones({super.key, required this.active});
//
//   final bool? active;
//
//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     final milestonesAsync = ref
//         .watch(userMilestonesProvider(HomeMilestonesRequest(status: active)));
//     return milestonesAsync.when(
//       data: (data) {
//         if (data.isEmpty) {
//           return const Padding(
//             padding: EdgeInsets.symmetric(vertical: 15),
//             child: Center(child: Text('No Milestones Found')),
//           );
//         }
//         return Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             SizedBox(
//               height: 200,
//               child: ListView(
//                 scrollDirection: Axis.horizontal,
//                 children: [
//                   SizedBox(width: DefaultAppPadding.defaultPadding),
//                   ...List.generate(data.length, (i) {
//                     return MilestoneItem(milestone: data[i]);
//                   }),
//                   const AddMilestoneItem(),
//                   SizedBox(width: DefaultAppPadding.defaultPadding),
//                 ],
//               ),
//             ),
//           ],
//         );
//       },
//       error: (err, st) {
//         debugPrint('ERRROORRRR:::: $err, $st');
//         return const Center(child: Text('Something went wrong'));
//       },
//       loading: () => const LoaderWidget(),
//     );
//   }
// }
//
// class Transactions extends ConsumerWidget {
//   const Transactions({super.key});
//
//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     final transactionsAsync = ref.watch(userTransactionsProvider);
//     return transactionsAsync.when(
//       data: (data) {
//         if (data.isEmpty) {
//           return const Center(
//             child: Text('No Transactions Found'),
//           );
//         }
//         return Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: List.generate(data.length, (i) {
//             DateTime createdAt =
//                 DateTime.fromMillisecondsSinceEpoch(data[i].createdAt ?? 0);
//             String formattedDate = DateFormat('E, MMM d').format(createdAt);
//             String daySuffix = AppUtils.getDaySuffix(createdAt.day);
//             return Padding(
//               padding: EdgeInsets.only(bottom: i == data.length - 1 ? 0 : 15),
//               child: TransactionItem(
//                 date: '$formattedDate$daySuffix',
//                 transaction: data[i].copyWith(
//                     amount: (data[i].amount ?? 0).isWholeNumber()
//                         ? (data[i].amount ?? 0).toInt()
//                         : data[i].amount ?? 0),
//               ),
//             );
//           }),
//         );
//       },
//       error: (err, st) {
//         debugPrint('ERRROORRRR:::: $err, $st');
//         return const Center(child: Text('Something went wrong'));
//       },
//       loading: () => const LoaderWidget(),
//     );
//   }
// }
//
// class AddMilestoneItem extends StatelessWidget {
//   const AddMilestoneItem({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: () {
//         context.router.push(AddProjectRoute());
//       },
//       child: Container(
//         width: 200,
//         height: 200,
//         decoration: ShapeDecoration(
//           color: const Color(0xFF182FFC),
//           shape: RoundedRectangleBorder(
//             side: const BorderSide(width: 0.50, color: Color(0x1E172FFC)),
//             borderRadius: BorderRadius.circular(20),
//           ),
//         ),
//         child: const Center(
//           child: Icon(
//             Icons.add,
//             color: Colors.white,
//             size: 80,
//           ),
//         ),
//       ),
//     );
//   }
// }
//
// class AppRefreshLoader extends StatelessWidget {
//   const AppRefreshLoader({super.key, required this.child, this.onRefresh});
//
//   final double _offsetToArmed = 220;
//   final Widget child;
//   final Future<void> Function()? onRefresh;
//
//   @override
//   Widget build(BuildContext context) {
//     return CustomRefreshIndicator(
//       onRefresh: onRefresh ?? () => Future.delayed(const Duration(seconds: 5)),
//       offsetToArmed: _offsetToArmed,
//       builder: (context, child, controller) => AnimatedBuilder(
//         animation: controller,
//         child: child,
//         builder: (context, child) {
//           return Stack(
//             children: <Widget>[
//               Container(
//                 width: double.infinity,
//                 height: _offsetToArmed * controller.value,
//                 color: AppColors.primary,
//                 child: const RiveAnimation.asset(RivePath.refreshV3),
//               ),
//               Transform.translate(
//                 offset: Offset(0.0, _offsetToArmed * controller.value),
//                 child: Padding(
//                   padding: EdgeInsets.only(
//                       top: onRefresh != null &&
//                               (_offsetToArmed * controller.value == 0.0)
//                           ? 0
//                           : 20.0),
//                   child: child,
//                 ),
//               ),
//             ],
//           );
//         },
//       ),
//       child: child,
//     );
//   }
// }
//
// class MilestoneItem extends StatelessWidget {
//   const MilestoneItem({
//     super.key,
//     required this.milestone,
//   });
//
//   final Milestone milestone;
//
//   @override
//   Widget build(BuildContext context) {
//     DateTime createdAt =
//         DateTime.fromMillisecondsSinceEpoch(milestone.createdAt ?? 0);
//     String formattedDate =
//         DateFormat('E, MMM d\'th', 'en_US').format(createdAt);
//     return Container(
//       width: 200,
//       height: 200,
//       padding: const EdgeInsets.all(20),
//       margin: const EdgeInsets.only(right: 16),
//       decoration: ShapeDecoration(
//         color: const Color(0x70E1E1E6),
//         shape: RoundedRectangleBorder(
//           side: const BorderSide(width: 0.50, color: Color(0x1E172FFC)),
//           borderRadius: BorderRadius.circular(20),
//         ),
//       ),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         children: [
//           SvgPicture.asset(SvgPaths.taskpayLogo),
//           Text.rich(
//             TextSpan(
//               children: [
//                 TextSpan(
//                   text: '\$${milestone.amount} ',
//                   style: textTheme(context)
//                       .headlineLarge
//                       ?.copyWith(color: AppColors.primary),
//                 ),
//                 TextSpan(
//                   text: 'total',
//                   style: textTheme(context).bodySmall?.copyWith(
//                         fontWeight: FontWeight.w500,
//                       ),
//                 ),
//               ],
//             ),
//             textAlign: TextAlign.right,
//           ),
//           Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Text(
//                 milestone.name ?? '-',
//                 style: textTheme(context)
//                     .labelLarge
//                     ?.copyWith(color: AppColors.textBlack),
//               ),
//               Text(
//                 'Sent . $formattedDate',
//                 style: textTheme(context).bodySmall?.copyWith(height: 1.5),
//               )
//             ],
//           )
//         ],
//       ),
//     );
//   }
// }
//
// class SectionHeader extends StatelessWidget {
//   const SectionHeader({
//     super.key,
//     required this.title,
//     required this.buttonText,
//     required this.onButtonPressed,
//   });
//
//   final String title;
//   final String buttonText;
//   final VoidCallback onButtonPressed;
//
//   @override
//   Widget build(BuildContext context) {
//     return Row(
//       children: [
//         Expanded(
//           child: Text(
//             title,
//             style: textTheme(context).headlineLarge,
//           ),
//         ),
//         ElevatedButton(
//           onPressed: onButtonPressed,
//           style: ElevatedButton.styleFrom(
//             backgroundColor: Colors.black,
//             elevation: 0,
//             padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
//           ),
//           child: Text(buttonText),
//         ),
//       ],
//     );
//   }
// }
//
// class Projects extends ConsumerWidget {
//   const Projects({super.key, required this.status});
//
//   final String status;
//
//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     final projectsAsync = ref.watch(homeProjectsProvider(status));
//     return projectsAsync.when(
//       data: (data) {
//         if (data.isEmpty) {
//           return const Padding(
//             padding: EdgeInsets.symmetric(vertical: 15),
//             child: Center(child: Text('No Projects Found')),
//           );
//         }
//         return DefaultAppPadding.horizontal(
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               ...List.generate(data.length, (i) {
//                 return ProjectCard(
//                   project: data[i],
//                   onPressed: () {
//                     context.router.push(ProjectDetailRoute(
//                         id: data[i].id ?? '', milestone: data[i]));
//                   },
//                 );
//               }),
//               verticalSpaceRegular,
//             ],
//           ),
//         );
//       },
//       error: (err, st) {
//         debugPrint('ERRROORRRR:::: $err, $st');
//         return const Center(child: Text('Something went wrong'));
//       },
//       loading: () => const LoaderWidget(),
//     );
//   }
// }
