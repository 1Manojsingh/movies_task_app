// import 'package:auto_route/auto_route.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:flutter_svg/svg.dart';
// import '../../../core/constants/paths.dart';
// import '../../../core/theme/app_colors.dart';
// import '../provider/search_provider.dart';
//
// @RoutePage()
// class SearchPage extends ConsumerStatefulWidget {
//   const SearchPage({super.key});
//
//   @override
//   ConsumerState<SearchPage> createState() => _SearchPageState();
// }
//
// class _SearchPageState extends ConsumerState<SearchPage> {
//   @override
//   Widget build(BuildContext context) {
//     final searchKeyword = ref.watch(mainSearchKeywordProvider);
//     //todo hit the discover API
//     return Scaffold(
//       body: SafeArea(
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             buildSearch(),
//             verticalSpaceRegular,
//             Expanded(
//               child: SingleChildScrollView(
//                 child: DefaultAppPadding.horizontal(
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       ShortcutActionButton(
//                         iconPath: AppPaths.qrSearchIcon,
//                         mainTitle: 'Scan QR Code',
//                         subtitle: 'Add Profile',
//                         onPressed: () {
//                           context.router.push(const QrRoute());
//                         },
//                       ),
//                       const ShortcutActionButton.svg(
//                         svgPath: SvgPaths.addCircle,
//                         mainTitle: 'Invite your friends to Taskpay',
//                         subtitle: 'Invite your friends',
//                       ),
//                       verticalSpaceRegular,
//                       Text('Recommended',
//                           style: textTheme(context).headlineLarge),
//                       verticalSpaceRegular,
//                       RecommendationCard(
//                           milestone: MarketplaceMilestone(
//                               userDetails: UserDetails(
//                                   firstName: 'Drew', lastName: 'Cano'),
//                               createdAt: DateTime.now().toIso8601String(),
//                               milestoneName: 'Gardening',
//                               milestoneAmount: '5000',
//                               taskDescription:
//                                   'Description of the project here'),
//                           user: User(),
//                           discoverMore: () {}),
//                       searchKeyword.isNotEmpty
//                           ? const SearchPeopleResults()
//                           : verticalSpaceSemiLarge,
//                       Text('Gardening Business',
//                           style: textTheme(context).headlineLarge),
//                       verticalSpaceRegular,
//                       const BusinessItem(
//                         imageUrl: "https://via.placeholder.com/40x40",
//                         name: "Jeremy Stanley",
//                         username: "@JeremyStanl",
//                         rating: 4.9,
//                         milestones: "1,421",
//                         earnings: "~54K",
//                       ),
//                       const BusinessItem(
//                         imageUrl: "https://via.placeholder.com/40x40",
//                         name: "Jeremy Stanley",
//                         username: "@JeremyStanl",
//                         rating: 4.9,
//                         milestones: "1,421",
//                         earnings: "~54K",
//                       ),
//                       const BusinessItem(
//                         imageUrl: "https://via.placeholder.com/40x40",
//                         name: "Jeremy Stanley",
//                         username: "@JeremyStanl",
//                         rating: 4.9,
//                         milestones: "1,421",
//                         earnings: "~54K",
//                       ),
//                       searchKeyword.isNotEmpty
//                           ? const SearchMilestoneResults()
//                           : verticalSpaceRegular,
//                     ],
//                   ),
//                 ),
//               ),
//             )
//           ],
//         ),
//       ),
//     );
//   }
//
//   DefaultAppPadding buildSearch() {
//     return DefaultAppPadding.horizontal(
//       child: Row(
//         children: [
//           const CornerBackButton(),
//           horizontalSpaceSmall,
//           const Expanded(
//             child: SearchBarField(hintText: 'People, Milestones, Projects'),
//           ),
//           horizontalSpaceSmall,
//           GestureDetector(
//             onTap: () {
//               context.router.push(const QrRoute());
//             },
//             child: Container(
//               width: 43,
//               padding: const EdgeInsets.all(5.22),
//               decoration: ShapeDecoration(
//                 color: const Color(0xFFF7F7F7),
//                 shape: RoundedRectangleBorder(
//                   borderRadius: BorderRadius.circular(16.99),
//                 ),
//               ),
//               child: Image.asset(AppPaths.qrSearchIcon),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
//
// class SearchBarField extends ConsumerStatefulWidget {
//   const SearchBarField({
//     super.key,
//     required this.hintText,
//   });
//
//   final String hintText;
//
//   @override
//   ConsumerState<SearchBarField> createState() => _SearchBarFieldState();
// }
//
// class _SearchBarFieldState extends ConsumerState<SearchBarField> {
//   TextEditingController searchController = TextEditingController();
//   @override
//   Widget build(BuildContext context) {
//     String mainSearch = ref.watch(mainSearchKeywordProvider);
//     if (mainSearch == 'searchController') {
//       searchController.clear();
//     }
//     return TextField(
//       autofocus: false,
//       onChanged: (val) {
//         ref.read(mainSearchKeywordProvider.notifier).state = val;
//       },
//       controller: searchController,
//       decoration: InputDecoration(
//         hintText: widget.hintText,
//         prefixIconConstraints: BoxConstraints.tight(const Size(40, 40)),
//         prefixIcon: Padding(
//           padding: const EdgeInsets.symmetric(horizontal: 10.0),
//           child: SvgPicture.asset(
//             SvgPaths.search,
//             width: 20,
//             fit: BoxFit.fitWidth,
//           ),
//         ),
//         filled: true,
//         fillColor: const Color(0xFFF7F7F7),
//         contentPadding: EdgeInsets.zero,
//         border: OutlineInputBorder(
//           borderRadius: BorderRadius.circular(162.50),
//           borderSide: BorderSide.none,
//         ),
//         enabledBorder: OutlineInputBorder(
//           borderRadius: BorderRadius.circular(162.50),
//           borderSide: const BorderSide(color: AppColors.primary, width: 1.5),
//         ),
//         focusedBorder: OutlineInputBorder(
//           borderRadius: BorderRadius.circular(162.50),
//           borderSide: const BorderSide(color: AppColors.primary, width: 1.5),
//         ),
//       ),
//     );
//   }
// }
//
// class SearchPeopleResults extends ConsumerStatefulWidget {
//   const SearchPeopleResults({super.key});
//
//   @override
//   ConsumerState<SearchPeopleResults> createState() =>
//       _SearchPeopleResultsState();
// }
//
// class _SearchPeopleResultsState extends ConsumerState<SearchPeopleResults> {
//   @override
//   Widget build(BuildContext context) {
//     final searchPeopleAsync = ref.watch(searchPeopleProvider);
//     return searchPeopleAsync.when(
//         data: (peopleList) {
//           return Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               verticalSpaceSemiLarge,
//               Text('People', style: textTheme(context).headlineLarge),
//               verticalSpaceRegular,
//               if (peopleList.isEmpty)
//                 const Center(child: Text('No people found'))
//               else
//                 ...List.generate(peopleList.length, (i) {
//                   return PeopleItem(
//                     imageUrl: peopleList[i].avatar ??
//                         'https://via.placeholder.com/40x40',
//                     name: peopleList[i].fullName ?? '-',
//                     username: "@${peopleList[i].username}",
//                   );
//                 }),
//               verticalSpaceSemiLarge,
//             ],
//           );
//         },
//         error: (err, st) {
//           debugPrint('ERRROORRRR:::: $err, $st');
//           return const Padding(
//             padding:EdgeInsets.symmetric(vertical: 20),
//               child:  Center(child: Text('Something went wrong')));
//         },
//         loading: () => const Padding(
//               padding: EdgeInsets.symmetric(vertical: 20),
//               child: LoaderWidget(),
//             ));
//   }
// }
//
// class SearchMilestoneResults extends ConsumerStatefulWidget {
//   const SearchMilestoneResults({super.key});
//
//   @override
//   ConsumerState<SearchMilestoneResults> createState() =>
//       _SearchMilestoneResultsState();
// }
//
// class _SearchMilestoneResultsState
//     extends ConsumerState<SearchMilestoneResults> {
//   @override
//   Widget build(BuildContext context) {
//     final searchMilestoneAsync = ref.watch(searchMilestonesProvider);
//     return searchMilestoneAsync.when(
//         data: (milestoneList) {
//           return Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               verticalSpaceMedium,
//               Text('Milestones', style: textTheme(context).headlineLarge),
//               verticalSpaceRegular,
//               if (milestoneList.isEmpty)
//                 const Center(child: Text('No milestones found'))
//               else
//                 ...List.generate(milestoneList.length, (i) {
//                   return Padding(
//                     padding: const EdgeInsets.only(bottom: 20),
//                     child: MilestoneCard(
//                         milestone: Milestone(
//                             id: milestoneList[i].id,
//                             userFullName: milestoneList[i].userFullName,
//                             createdAt: DateTime.now().millisecondsSinceEpoch,
//                             name: milestoneList[i].name,
//                             userAvatar: milestoneList[i].userAvatar,
//                             amount: milestoneList[i].amount,
//                             description: milestoneList[i].description)),
//                   );
//                 }),
//               verticalSpaceMedium,
//             ],
//           );
//         },
//         error: (err, st) {
//           debugPrint('ERRROORRRR:::: $err, $st');
//           return Padding(
//               padding: EdgeInsets.symmetric(vertical: 20),
//               child: Center(child: Text('Something went wrong')));
//         },
//         loading: () => const Padding(
//               padding: EdgeInsets.symmetric(vertical: 20),
//               child: LoaderWidget(),
//             ));
//   }
// }
