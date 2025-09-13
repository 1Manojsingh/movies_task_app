// import 'package:auto_route/auto_route.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_svg/svg.dart';
// import 'package:task_pay/core/router/app_router.dart';
//
// import '../../../core/constants/paths.dart';
// import '../../../core/theme/app_colors.dart';
// import '../../../core/utilities/design_utility.dart';
//
// class AppBarItem {
//   const AppBarItem({
//     required this.title,
//     required this.iconPath,
//   });
//
//   final String title;
//   final String iconPath;
// }
//
// class AppBottomNavBar extends StatefulWidget {
//   const AppBottomNavBar({
//     super.key,
//     required this.onPageChanged,
//     required this.selectedPage,
//   });
//
//   final Function(int index) onPageChanged;
//   final int selectedPage;
//
//   @override
//   State<AppBottomNavBar> createState() => _AppBottomNavBarState();
// }
//
// class _AppBottomNavBarState extends State<AppBottomNavBar> {
//   final items = [
//     const AppBarItem(title: "Home", iconPath: SvgPaths.home),
//     const AppBarItem(title: "Transactions", iconPath: SvgPaths.money),
//     const AppBarItem(title: "Projects", iconPath: SvgPaths.suitcase),
//     const AppBarItem(title: "Feed", iconPath: SvgPaths.history),
//   ];
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       color: Colors.white,
//       child: Container(
//         height: 75,
//         margin: EdgeInsets.only(bottom: MediaQuery.of(context).padding.bottom),
//         decoration: BoxDecoration(
//           color: Colors.white,
//           border: Border(
//             top: BorderSide(color: Colors.black.withOpacity(.2), width: 1),
//           ),
//         ),
//         padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
//         child: Row(
//           children: [
//             AppBottomNavItem(
//               isActive: widget.selectedPage == 0,
//               title: items[0].title,
//               iconPath: items[0].iconPath,
//               onTap: () {
//                 widget.onPageChanged(0);
//               },
//             ),
//             AppBottomNavItem(
//               isActive: widget.selectedPage == 1,
//               title: items[1].title,
//               iconPath: items[1].iconPath,
//               onTap: () {
//                 widget.onPageChanged(1);
//               },
//             ),
//             Expanded(
//               child: CupertinoButton(
//                 padding: EdgeInsets.zero,
//                 onPressed: () {
//                   context.router.push(AddProjectRoute());
//                 },
//                 child: Image.asset(AppPaths.taskpayLogoMark),
//               ),
//             ),
//             AppBottomNavItem(
//               isActive: widget.selectedPage == 2,
//               title: items[2].title,
//               iconPath: items[2].iconPath,
//               onTap: () {
//                 widget.onPageChanged(2);
//               },
//             ),
//             AppBottomNavItem(
//               isActive: widget.selectedPage == 3,
//               title: items[3].title,
//               iconPath: items[3].iconPath,
//               onTap: () {
//                 widget.onPageChanged(3);
//               },
//             ),
//           ],
//           // children: List.generate(
//           //   items.length,
//           //   (index) {
//           //     final item = items[index];
//           //     return AppBottomNavItem(
//           //       isActive: widget.selectedPage == index,
//           //       title: item.title,
//           //       iconPath: item.iconPath,
//           //       onTap: () {
//           //         widget.onPageChanged(index);
//           //       },
//           //     );
//           //   },
//           // ),
//         ),
//       ),
//     );
//   }
// }
//
// class AppBottomNavItem extends StatelessWidget {
//   const AppBottomNavItem({
//     super.key,
//     required this.isActive,
//     required this.title,
//     required this.iconPath,
//     required this.onTap,
//   });
//
//   final bool isActive;
//
//   final String title;
//   final String iconPath;
//   final VoidCallback onTap;
//
//   @override
//   Widget build(BuildContext context) {
//     return CupertinoButton(
//       // onTap: onTap,
//       onPressed: onTap,
//       padding: EdgeInsets.zero,
//       child: SizedBox(
//         width: 70,
//         height: 70,
//         child: FittedBox(
//           child: Stack(
//             alignment: Alignment.center,
//             children: [
//               Column(
//                 children: [
//                   verticalSpaceSmall,
//                   SvgPicture.asset(
//                     iconPath,
//                     colorFilter: ColorFilter.mode(
//                         isActive ? AppColors.primary : AppColors.textGray,
//                         BlendMode.srcIn),
//                     height: 24,
//                   ),
//                   verticalSpaceSmall,
//                   Text(
//                     title,
//                     style: textTheme(context).bodySmall?.copyWith(
//                         color:
//                             isActive ? AppColors.primary : AppColors.textGray),
//                   ),
//                 ],
//               ),
//               if (isActive)
//                 const Positioned(
//                   top: 0,
//                   child: CircleAvatar(
//                     radius: 2,
//                     backgroundColor: AppColors.primary,
//                   ),
//                 ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
