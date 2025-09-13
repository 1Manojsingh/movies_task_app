// // GENERATED CODE - DO NOT MODIFY BY HAND
//
// // **************************************************************************
// // AutoRouterGenerator
// // **************************************************************************
//
// // ignore_for_file: type=lint
// // coverage:ignore-file
//
// // ignore_for_file: no_leading_underscores_for_library_prefixes
// import 'package:auto_route/auto_route.dart' as _i32;
// import 'package:bookmytask/feature/about_us/about_us_screen.dart' as _i1;
// import 'package:bookmytask/feature/about_us/sub_screens/bmt_goals_page.dart'
//     as _i3;
// import 'package:bookmytask/feature/about_us/sub_screens/hello_bmt_page.dart'
//     as _i11;
// import 'package:bookmytask/feature/about_us/sub_screens/investor_relations_page.dart'
//     as _i15;
// import 'package:bookmytask/feature/auth/screens/location_selection_page.dart'
//     as _i17;
// import 'package:bookmytask/feature/auth/screens/login_page.dart' as _i18;
// import 'package:bookmytask/feature/auth/screens/otp_verification_page.dart'
//     as _i19;
// import 'package:bookmytask/feature/auth/screens/signup_page.dart' as _i26;
// import 'package:bookmytask/feature/auth/screens/username_selection_page.dart'
//     as _i29;
// import 'package:bookmytask/feature/auth/widgets/location_bottom_sheet.dart'
//     as _i16;
// import 'package:bookmytask/feature/bmt_club/screens/bmt_club_page.dart' as _i4;
// import 'package:bookmytask/feature/entry/screens/dummy_login.dart' as _i10;
// import 'package:bookmytask/feature/entry/screens/splash_screen.dart' as _i27;
// import 'package:bookmytask/feature/home/screens/bottom_nav_bar.dart' as _i8;
// import 'package:bookmytask/feature/home/screens/home_page.dart' as _i13;
// import 'package:bookmytask/feature/home/screens/services_page.dart' as _i25;
// import 'package:bookmytask/feature/interior/screens/interior_page.dart' as _i14;
// import 'package:bookmytask/feature/profile/screens/bmt_wallet/bmt_wallet_screen.dart'
//     as _i5;
// import 'package:bookmytask/feature/profile/screens/profile_page.dart' as _i22;
// import 'package:bookmytask/feature/profile/screens/sub_screens/address/address_page.dart'
//     as _i2;
// import 'package:bookmytask/feature/profile/screens/sub_screens/edit_profile.dart'
//     as _i9;
// import 'package:bookmytask/feature/profile/screens/sub_screens/help_and_support/help_and_support.dart'
//     as _i12;
// import 'package:bookmytask/feature/profile/screens/sub_screens/refer_and_earn/refer_and_earn.dart'
//     as _i23;
// import 'package:bookmytask/feature/profile/screens/sub_screens/your_booking_and_plan/booking_details.dart'
//     as _i7;
// import 'package:bookmytask/feature/profile/screens/sub_screens/your_booking_and_plan/plan_details.dart'
//     as _i21;
// import 'package:bookmytask/feature/profile/screens/sub_screens/your_booking_and_plan/plan_details_web.dart'
//     as _i20;
// import 'package:bookmytask/feature/profile/screens/sub_screens/your_booking_and_plan/your_booking_plane.dart'
//     as _i31;
// import 'package:bookmytask/feature/service/screens/service_web.dart' as _i24;
// import 'package:bookmytask/feature/service/screens/web_service_booking_page.dart'
//     as _i30;
// import 'package:bookmytask/feature/task/models/service_model.dart' as _i37;
// import 'package:bookmytask/feature/task/models/user_package.dart' as _i35;
// import 'package:bookmytask/feature/task/screens/booking_confirmation_screen_web.dart'
//     as _i6;
// import 'package:bookmytask/feature/task/screens/task_category_screen.dart'
//     as _i28;
// import 'package:bookmytask/feature/user/model/user_model.dart' as _i36;
// import 'package:bookmytask/feature/user/model/user_model_api.dart' as _i38;
// import 'package:flutter/foundation.dart' as _i34;
// import 'package:flutter/material.dart' as _i33;
//
// abstract class $AppRouter extends _i32.RootStackRouter {
//   $AppRouter({super.navigatorKey});
//
//   @override
//   final Map<String, _i32.PageFactory> pagesMap = {
//     AboutRoute.name: (routeData) {
//       return _i32.AutoRoutePage<dynamic>(
//         routeData: routeData,
//         child: const _i1.AboutPage(),
//       );
//     },
//     AddressRoute.name: (routeData) {
//       return _i32.AutoRoutePage<dynamic>(
//         routeData: routeData,
//         child: const _i2.AddressPage(),
//       );
//     },
//     BMTGoalsRoute.name: (routeData) {
//       return _i32.AutoRoutePage<dynamic>(
//         routeData: routeData,
//         child: const _i3.BMTGoalsPage(),
//       );
//     },
//     BmtClubRoute.name: (routeData) {
//       return _i32.AutoRoutePage<dynamic>(
//         routeData: routeData,
//         child: const _i4.BmtClubPage(),
//       );
//     },
//     BmtWalletRoute.name: (routeData) {
//       return _i32.AutoRoutePage<dynamic>(
//         routeData: routeData,
//         child: const _i5.BmtWalletPage(),
//       );
//     },
//     BookingConfirmationScreenWeb.name: (routeData) {
//       final args = routeData.argsAs<BookingConfirmationScreenWebArgs>(
//           orElse: () => const BookingConfirmationScreenWebArgs());
//       return _i32.AutoRoutePage<dynamic>(
//         routeData: routeData,
//         child: _i6.BookingConfirmationScreenWeb(
//           bookingId: args.bookingId,
//           isPackage: args.isPackage,
//           key: args.key,
//         ),
//       );
//     },
//     BookingDetailsRoute.name: (routeData) {
//       final args = routeData.argsAs<BookingDetailsRouteArgs>();
//       return _i32.AutoRoutePage<dynamic>(
//         routeData: routeData,
//         child: _i7.BookingDetailsPage(
//           bookingId: args.bookingId,
//           key: args.key,
//         ),
//       );
//     },
//     BottomNavBarRoute.name: (routeData) {
//       final args = routeData.argsAs<BottomNavBarRouteArgs>(
//           orElse: () => const BottomNavBarRouteArgs());
//       return _i32.AutoRoutePage<dynamic>(
//         routeData: routeData,
//         child: _i8.BottomNavBarPage(
//           key: args.key,
//           currentIndex: args.currentIndex,
//         ),
//       );
//     },
//     EditProfileRoute.name: (routeData) {
//       return _i32.AutoRoutePage<dynamic>(
//         routeData: routeData,
//         child: const _i9.EditProfilePage(),
//       );
//     },
//     EmailLoginRoute.name: (routeData) {
//       return _i32.AutoRoutePage<dynamic>(
//         routeData: routeData,
//         child: const _i10.EmailLoginPage(),
//       );
//     },
//     HelloBMTRoute.name: (routeData) {
//       return _i32.AutoRoutePage<dynamic>(
//         routeData: routeData,
//         child: const _i11.HelloBMTPage(),
//       );
//     },
//     HelpAndSupportRoute.name: (routeData) {
//       return _i32.AutoRoutePage<dynamic>(
//         routeData: routeData,
//         child: const _i12.HelpAndSupportPage(),
//       );
//     },
//     HomeRoute.name: (routeData) {
//       return _i32.AutoRoutePage<dynamic>(
//         routeData: routeData,
//         child: const _i13.HomePage(),
//       );
//     },
//     InteriorRoute.name: (routeData) {
//       return _i32.AutoRoutePage<dynamic>(
//         routeData: routeData,
//         child: const _i14.InteriorPage(),
//       );
//     },
//     InvestorRelationsRoute.name: (routeData) {
//       return _i32.AutoRoutePage<dynamic>(
//         routeData: routeData,
//         child: const _i15.InvestorRelationsPage(),
//       );
//     },
//     LocationBottomSheetRoute.name: (routeData) {
//       return _i32.AutoRoutePage<dynamic>(
//         routeData: routeData,
//         child: const _i16.LocationBottomSheetPage(),
//       );
//     },
//     LocationSelectionRoute.name: (routeData) {
//       return _i32.AutoRoutePage<dynamic>(
//         routeData: routeData,
//         child: const _i17.LocationSelectionPage(),
//       );
//     },
//     LoginRoute.name: (routeData) {
//       return _i32.AutoRoutePage<dynamic>(
//         routeData: routeData,
//         child: const _i18.LoginPage(),
//       );
//     },
//     OtpVerificationRoute.name: (routeData) {
//       final args = routeData.argsAs<OtpVerificationRouteArgs>();
//       return _i32.AutoRoutePage<dynamic>(
//         routeData: routeData,
//         child: _i19.OtpVerificationPage(
//           key: args.key,
//           phoneNumber: args.phoneNumber,
//         ),
//       );
//     },
//     PlanDetailsBodyRoute.name: (routeData) {
//       final args = routeData.argsAs<PlanDetailsBodyRouteArgs>();
//       return _i32.AutoRoutePage<dynamic>(
//         routeData: routeData,
//         child: _i20.PlanDetailsBodyPage(
//           key: args.key,
//           userPackage: args.userPackage,
//         ),
//       );
//     },
//     PlanDetailsRoute.name: (routeData) {
//       final args = routeData.argsAs<PlanDetailsRouteArgs>();
//       return _i32.AutoRoutePage<dynamic>(
//         routeData: routeData,
//         child: _i21.PlanDetailsPage(
//           key: args.key,
//           packageBookingId: args.packageBookingId,
//         ),
//       );
//     },
//     PlanDetailsWebRoute.name: (routeData) {
//       final args = routeData.argsAs<PlanDetailsWebRouteArgs>();
//       return _i32.AutoRoutePage<dynamic>(
//         routeData: routeData,
//         child: _i20.PlanDetailsWebPage(
//           key: args.key,
//           userPackage: args.userPackage,
//         ),
//       );
//     },
//     ProfileRoute.name: (routeData) {
//       return _i32.AutoRoutePage<dynamic>(
//         routeData: routeData,
//         child: const _i22.ProfilePage(),
//       );
//     },
//     ReferAndEarnRoute.name: (routeData) {
//       return _i32.AutoRoutePage<dynamic>(
//         routeData: routeData,
//         child: const _i23.ReferAndEarnPage(),
//       );
//     },
//     ServiceWebRoute.name: (routeData) {
//       final pathParams = routeData.inheritedPathParams;
//       final args = routeData.argsAs<ServiceWebRouteArgs>(
//           orElse: () => ServiceWebRouteArgs(
//                 categoryName: pathParams.getString('categoryName'),
//                 categoryId: pathParams.getInt('categoryId'),
//               ));
//       return _i32.AutoRoutePage<dynamic>(
//         routeData: routeData,
//         child: _i24.ServiceWebPage(
//           key: args.key,
//           categoryName: args.categoryName,
//           categoryId: args.categoryId,
//         ),
//       );
//     },
//     ServicesRoute.name: (routeData) {
//       return _i32.AutoRoutePage<dynamic>(
//         routeData: routeData,
//         child: const _i25.ServicesPage(),
//       );
//     },
//     SignUpRoute.name: (routeData) {
//       final args = routeData.argsAs<SignUpRouteArgs>();
//       return _i32.AutoRoutePage<dynamic>(
//         routeData: routeData,
//         child: _i26.SignUpPage(
//           key: args.key,
//           phoneNumber: args.phoneNumber,
//         ),
//       );
//     },
//     SplashScreen.name: (routeData) {
//       return _i32.AutoRoutePage<dynamic>(
//         routeData: routeData,
//         child: const _i27.SplashScreen(),
//       );
//     },
//     TaskCategoriesRoute.name: (routeData) {
//       final args = routeData.argsAs<TaskCategoriesRouteArgs>();
//       return _i32.AutoRoutePage<dynamic>(
//         routeData: routeData,
//         child: _i28.TaskCategoriesPage(
//           categoryName: args.categoryName,
//           categoryId: args.categoryId,
//           key: args.key,
//         ),
//       );
//     },
//     UsernameSelectionRoute.name: (routeData) {
//       final args = routeData.argsAs<UsernameSelectionRouteArgs>();
//       return _i32.AutoRoutePage<dynamic>(
//         routeData: routeData,
//         child: _i29.UsernameSelectionPage(
//           key: args.key,
//           user: args.user,
//         ),
//       );
//     },
//     WebCartRoute.name: (routeData) {
//       final args = routeData.argsAs<WebCartRouteArgs>();
//       return _i32.AutoRoutePage<dynamic>(
//         routeData: routeData,
//         child: _i30.WebCartPage(
//           key: args.key,
//           isLoading: args.isLoading,
//           service: args.service,
//           categoryId: args.categoryId,
//           isFromPackage: args.isFromPackage,
//           optionId: args.optionId,
//           packageId: args.packageId,
//           canEditAddons: args.canEditAddons,
//           packageBookingId: args.packageBookingId,
//           userData: args.userData,
//           isPackageServiceBooking: args.isPackageServiceBooking,
//         ),
//       );
//     },
//     YourBookingPlaneRoute.name: (routeData) {
//       return _i32.AutoRoutePage<dynamic>(
//         routeData: routeData,
//         child: const _i31.YourBookingPlanePage(),
//       );
//     },
//   };
// }
//
// /// generated route for
// /// [_i1.AboutPage]
// class AboutRoute extends _i32.PageRouteInfo<void> {
//   const AboutRoute({List<_i32.PageRouteInfo>? children})
//       : super(
//           AboutRoute.name,
//           initialChildren: children,
//         );
//
//   static const String name = 'AboutRoute';
//
//   static const _i32.PageInfo<void> page = _i32.PageInfo<void>(name);
// }
//
// /// generated route for
// /// [_i2.AddressPage]
// class AddressRoute extends _i32.PageRouteInfo<void> {
//   const AddressRoute({List<_i32.PageRouteInfo>? children})
//       : super(
//           AddressRoute.name,
//           initialChildren: children,
//         );
//
//   static const String name = 'AddressRoute';
//
//   static const _i32.PageInfo<void> page = _i32.PageInfo<void>(name);
// }
//
// /// generated route for
// /// [_i3.BMTGoalsPage]
// class BMTGoalsRoute extends _i32.PageRouteInfo<void> {
//   const BMTGoalsRoute({List<_i32.PageRouteInfo>? children})
//       : super(
//           BMTGoalsRoute.name,
//           initialChildren: children,
//         );
//
//   static const String name = 'BMTGoalsRoute';
//
//   static const _i32.PageInfo<void> page = _i32.PageInfo<void>(name);
// }
//
// /// generated route for
// /// [_i4.BmtClubPage]
// class BmtClubRoute extends _i32.PageRouteInfo<void> {
//   const BmtClubRoute({List<_i32.PageRouteInfo>? children})
//       : super(
//           BmtClubRoute.name,
//           initialChildren: children,
//         );
//
//   static const String name = 'BmtClubRoute';
//
//   static const _i32.PageInfo<void> page = _i32.PageInfo<void>(name);
// }
//
// /// generated route for
// /// [_i5.BmtWalletPage]
// class BmtWalletRoute extends _i32.PageRouteInfo<void> {
//   const BmtWalletRoute({List<_i32.PageRouteInfo>? children})
//       : super(
//           BmtWalletRoute.name,
//           initialChildren: children,
//         );
//
//   static const String name = 'BmtWalletRoute';
//
//   static const _i32.PageInfo<void> page = _i32.PageInfo<void>(name);
// }
//
// /// generated route for
// /// [_i6.BookingConfirmationScreenWeb]
// class BookingConfirmationScreenWeb
//     extends _i32.PageRouteInfo<BookingConfirmationScreenWebArgs> {
//   BookingConfirmationScreenWeb({
//     int? bookingId,
//     bool isPackage = false,
//     _i33.Key? key,
//     List<_i32.PageRouteInfo>? children,
//   }) : super(
//           BookingConfirmationScreenWeb.name,
//           args: BookingConfirmationScreenWebArgs(
//             bookingId: bookingId,
//             isPackage: isPackage,
//             key: key,
//           ),
//           initialChildren: children,
//         );
//
//   static const String name = 'BookingConfirmationScreenWeb';
//
//   static const _i32.PageInfo<BookingConfirmationScreenWebArgs> page =
//       _i32.PageInfo<BookingConfirmationScreenWebArgs>(name);
// }
//
// class BookingConfirmationScreenWebArgs {
//   const BookingConfirmationScreenWebArgs({
//     this.bookingId,
//     this.isPackage = false,
//     this.key,
//   });
//
//   final int? bookingId;
//
//   final bool isPackage;
//
//   final _i33.Key? key;
//
//   @override
//   String toString() {
//     return 'BookingConfirmationScreenWebArgs{bookingId: $bookingId, isPackage: $isPackage, key: $key}';
//   }
// }
//
// /// generated route for
// /// [_i7.BookingDetailsPage]
// class BookingDetailsRoute extends _i32.PageRouteInfo<BookingDetailsRouteArgs> {
//   BookingDetailsRoute({
//     required int bookingId,
//     _i34.Key? key,
//     List<_i32.PageRouteInfo>? children,
//   }) : super(
//           BookingDetailsRoute.name,
//           args: BookingDetailsRouteArgs(
//             bookingId: bookingId,
//             key: key,
//           ),
//           initialChildren: children,
//         );
//
//   static const String name = 'BookingDetailsRoute';
//
//   static const _i32.PageInfo<BookingDetailsRouteArgs> page =
//       _i32.PageInfo<BookingDetailsRouteArgs>(name);
// }
//
// class BookingDetailsRouteArgs {
//   const BookingDetailsRouteArgs({
//     required this.bookingId,
//     this.key,
//   });
//
//   final int bookingId;
//
//   final _i34.Key? key;
//
//   @override
//   String toString() {
//     return 'BookingDetailsRouteArgs{bookingId: $bookingId, key: $key}';
//   }
// }
//
// /// generated route for
// /// [_i8.BottomNavBarPage]
// class BottomNavBarRoute extends _i32.PageRouteInfo<BottomNavBarRouteArgs> {
//   BottomNavBarRoute({
//     _i33.Key? key,
//     int currentIndex = 0,
//     List<_i32.PageRouteInfo>? children,
//   }) : super(
//           BottomNavBarRoute.name,
//           args: BottomNavBarRouteArgs(
//             key: key,
//             currentIndex: currentIndex,
//           ),
//           initialChildren: children,
//         );
//
//   static const String name = 'BottomNavBarRoute';
//
//   static const _i32.PageInfo<BottomNavBarRouteArgs> page =
//       _i32.PageInfo<BottomNavBarRouteArgs>(name);
// }
//
// class BottomNavBarRouteArgs {
//   const BottomNavBarRouteArgs({
//     this.key,
//     this.currentIndex = 0,
//   });
//
//   final _i33.Key? key;
//
//   final int currentIndex;
//
//   @override
//   String toString() {
//     return 'BottomNavBarRouteArgs{key: $key, currentIndex: $currentIndex}';
//   }
// }
//
// /// generated route for
// /// [_i9.EditProfilePage]
// class EditProfileRoute extends _i32.PageRouteInfo<void> {
//   const EditProfileRoute({List<_i32.PageRouteInfo>? children})
//       : super(
//           EditProfileRoute.name,
//           initialChildren: children,
//         );
//
//   static const String name = 'EditProfileRoute';
//
//   static const _i32.PageInfo<void> page = _i32.PageInfo<void>(name);
// }
//
// /// generated route for
// /// [_i10.EmailLoginPage]
// class EmailLoginRoute extends _i32.PageRouteInfo<void> {
//   const EmailLoginRoute({List<_i32.PageRouteInfo>? children})
//       : super(
//           EmailLoginRoute.name,
//           initialChildren: children,
//         );
//
//   static const String name = 'EmailLoginRoute';
//
//   static const _i32.PageInfo<void> page = _i32.PageInfo<void>(name);
// }
//
// /// generated route for
// /// [_i11.HelloBMTPage]
// class HelloBMTRoute extends _i32.PageRouteInfo<void> {
//   const HelloBMTRoute({List<_i32.PageRouteInfo>? children})
//       : super(
//           HelloBMTRoute.name,
//           initialChildren: children,
//         );
//
//   static const String name = 'HelloBMTRoute';
//
//   static const _i32.PageInfo<void> page = _i32.PageInfo<void>(name);
// }
//
// /// generated route for
// /// [_i12.HelpAndSupportPage]
// class HelpAndSupportRoute extends _i32.PageRouteInfo<void> {
//   const HelpAndSupportRoute({List<_i32.PageRouteInfo>? children})
//       : super(
//           HelpAndSupportRoute.name,
//           initialChildren: children,
//         );
//
//   static const String name = 'HelpAndSupportRoute';
//
//   static const _i32.PageInfo<void> page = _i32.PageInfo<void>(name);
// }
//
// /// generated route for
// /// [_i13.HomePage]
// class HomeRoute extends _i32.PageRouteInfo<void> {
//   const HomeRoute({List<_i32.PageRouteInfo>? children})
//       : super(
//           HomeRoute.name,
//           initialChildren: children,
//         );
//
//   static const String name = 'HomeRoute';
//
//   static const _i32.PageInfo<void> page = _i32.PageInfo<void>(name);
// }
//
// /// generated route for
// /// [_i14.InteriorPage]
// class InteriorRoute extends _i32.PageRouteInfo<void> {
//   const InteriorRoute({List<_i32.PageRouteInfo>? children})
//       : super(
//           InteriorRoute.name,
//           initialChildren: children,
//         );
//
//   static const String name = 'InteriorRoute';
//
//   static const _i32.PageInfo<void> page = _i32.PageInfo<void>(name);
// }
//
// /// generated route for
// /// [_i15.InvestorRelationsPage]
// class InvestorRelationsRoute extends _i32.PageRouteInfo<void> {
//   const InvestorRelationsRoute({List<_i32.PageRouteInfo>? children})
//       : super(
//           InvestorRelationsRoute.name,
//           initialChildren: children,
//         );
//
//   static const String name = 'InvestorRelationsRoute';
//
//   static const _i32.PageInfo<void> page = _i32.PageInfo<void>(name);
// }
//
// /// generated route for
// /// [_i16.LocationBottomSheetPage]
// class LocationBottomSheetRoute extends _i32.PageRouteInfo<void> {
//   const LocationBottomSheetRoute({List<_i32.PageRouteInfo>? children})
//       : super(
//           LocationBottomSheetRoute.name,
//           initialChildren: children,
//         );
//
//   static const String name = 'LocationBottomSheetRoute';
//
//   static const _i32.PageInfo<void> page = _i32.PageInfo<void>(name);
// }
//
// /// generated route for
// /// [_i17.LocationSelectionPage]
// class LocationSelectionRoute extends _i32.PageRouteInfo<void> {
//   const LocationSelectionRoute({List<_i32.PageRouteInfo>? children})
//       : super(
//           LocationSelectionRoute.name,
//           initialChildren: children,
//         );
//
//   static const String name = 'LocationSelectionRoute';
//
//   static const _i32.PageInfo<void> page = _i32.PageInfo<void>(name);
// }
//
// /// generated route for
// /// [_i18.LoginPage]
// class LoginRoute extends _i32.PageRouteInfo<void> {
//   const LoginRoute({List<_i32.PageRouteInfo>? children})
//       : super(
//           LoginRoute.name,
//           initialChildren: children,
//         );
//
//   static const String name = 'LoginRoute';
//
//   static const _i32.PageInfo<void> page = _i32.PageInfo<void>(name);
// }
//
// /// generated route for
// /// [_i19.OtpVerificationPage]
// class OtpVerificationRoute
//     extends _i32.PageRouteInfo<OtpVerificationRouteArgs> {
//   OtpVerificationRoute({
//     _i33.Key? key,
//     required String phoneNumber,
//     List<_i32.PageRouteInfo>? children,
//   }) : super(
//           OtpVerificationRoute.name,
//           args: OtpVerificationRouteArgs(
//             key: key,
//             phoneNumber: phoneNumber,
//           ),
//           initialChildren: children,
//         );
//
//   static const String name = 'OtpVerificationRoute';
//
//   static const _i32.PageInfo<OtpVerificationRouteArgs> page =
//       _i32.PageInfo<OtpVerificationRouteArgs>(name);
// }
//
// class OtpVerificationRouteArgs {
//   const OtpVerificationRouteArgs({
//     this.key,
//     required this.phoneNumber,
//   });
//
//   final _i33.Key? key;
//
//   final String phoneNumber;
//
//   @override
//   String toString() {
//     return 'OtpVerificationRouteArgs{key: $key, phoneNumber: $phoneNumber}';
//   }
// }
//
// /// generated route for
// /// [_i20.PlanDetailsBodyPage]
// class PlanDetailsBodyRoute
//     extends _i32.PageRouteInfo<PlanDetailsBodyRouteArgs> {
//   PlanDetailsBodyRoute({
//     _i33.Key? key,
//     required _i35.UserPackage userPackage,
//     List<_i32.PageRouteInfo>? children,
//   }) : super(
//           PlanDetailsBodyRoute.name,
//           args: PlanDetailsBodyRouteArgs(
//             key: key,
//             userPackage: userPackage,
//           ),
//           initialChildren: children,
//         );
//
//   static const String name = 'PlanDetailsBodyRoute';
//
//   static const _i32.PageInfo<PlanDetailsBodyRouteArgs> page =
//       _i32.PageInfo<PlanDetailsBodyRouteArgs>(name);
// }
//
// class PlanDetailsBodyRouteArgs {
//   const PlanDetailsBodyRouteArgs({
//     this.key,
//     required this.userPackage,
//   });
//
//   final _i33.Key? key;
//
//   final _i35.UserPackage userPackage;
//
//   @override
//   String toString() {
//     return 'PlanDetailsBodyRouteArgs{key: $key, userPackage: $userPackage}';
//   }
// }
//
// /// generated route for
// /// [_i21.PlanDetailsPage]
// class PlanDetailsRoute extends _i32.PageRouteInfo<PlanDetailsRouteArgs> {
//   PlanDetailsRoute({
//     _i33.Key? key,
//     required int packageBookingId,
//     List<_i32.PageRouteInfo>? children,
//   }) : super(
//           PlanDetailsRoute.name,
//           args: PlanDetailsRouteArgs(
//             key: key,
//             packageBookingId: packageBookingId,
//           ),
//           initialChildren: children,
//         );
//
//   static const String name = 'PlanDetailsRoute';
//
//   static const _i32.PageInfo<PlanDetailsRouteArgs> page =
//       _i32.PageInfo<PlanDetailsRouteArgs>(name);
// }
//
// class PlanDetailsRouteArgs {
//   const PlanDetailsRouteArgs({
//     this.key,
//     required this.packageBookingId,
//   });
//
//   final _i33.Key? key;
//
//   final int packageBookingId;
//
//   @override
//   String toString() {
//     return 'PlanDetailsRouteArgs{key: $key, packageBookingId: $packageBookingId}';
//   }
// }
//
// /// generated route for
// /// [_i20.PlanDetailsWebPage]
// class PlanDetailsWebRoute extends _i32.PageRouteInfo<PlanDetailsWebRouteArgs> {
//   PlanDetailsWebRoute({
//     _i33.Key? key,
//     required _i35.UserPackage userPackage,
//     List<_i32.PageRouteInfo>? children,
//   }) : super(
//           PlanDetailsWebRoute.name,
//           args: PlanDetailsWebRouteArgs(
//             key: key,
//             userPackage: userPackage,
//           ),
//           initialChildren: children,
//         );
//
//   static const String name = 'PlanDetailsWebRoute';
//
//   static const _i32.PageInfo<PlanDetailsWebRouteArgs> page =
//       _i32.PageInfo<PlanDetailsWebRouteArgs>(name);
// }
//
// class PlanDetailsWebRouteArgs {
//   const PlanDetailsWebRouteArgs({
//     this.key,
//     required this.userPackage,
//   });
//
//   final _i33.Key? key;
//
//   final _i35.UserPackage userPackage;
//
//   @override
//   String toString() {
//     return 'PlanDetailsWebRouteArgs{key: $key, userPackage: $userPackage}';
//   }
// }
//
// /// generated route for
// /// [_i22.ProfilePage]
// class ProfileRoute extends _i32.PageRouteInfo<void> {
//   const ProfileRoute({List<_i32.PageRouteInfo>? children})
//       : super(
//           ProfileRoute.name,
//           initialChildren: children,
//         );
//
//   static const String name = 'ProfileRoute';
//
//   static const _i32.PageInfo<void> page = _i32.PageInfo<void>(name);
// }
//
// /// generated route for
// /// [_i23.ReferAndEarnPage]
// class ReferAndEarnRoute extends _i32.PageRouteInfo<void> {
//   const ReferAndEarnRoute({List<_i32.PageRouteInfo>? children})
//       : super(
//           ReferAndEarnRoute.name,
//           initialChildren: children,
//         );
//
//   static const String name = 'ReferAndEarnRoute';
//
//   static const _i32.PageInfo<void> page = _i32.PageInfo<void>(name);
// }
//
// /// generated route for
// /// [_i24.ServiceWebPage]
// class ServiceWebRoute extends _i32.PageRouteInfo<ServiceWebRouteArgs> {
//   ServiceWebRoute({
//     _i33.Key? key,
//     required String categoryName,
//     required int categoryId,
//     List<_i32.PageRouteInfo>? children,
//   }) : super(
//           ServiceWebRoute.name,
//           args: ServiceWebRouteArgs(
//             key: key,
//             categoryName: categoryName,
//             categoryId: categoryId,
//           ),
//           rawPathParams: {
//             'categoryName': categoryName,
//             'categoryId': categoryId,
//           },
//           initialChildren: children,
//         );
//
//   static const String name = 'ServiceWebRoute';
//
//   static const _i32.PageInfo<ServiceWebRouteArgs> page =
//       _i32.PageInfo<ServiceWebRouteArgs>(name);
// }
//
// class ServiceWebRouteArgs {
//   const ServiceWebRouteArgs({
//     this.key,
//     required this.categoryName,
//     required this.categoryId,
//   });
//
//   final _i33.Key? key;
//
//   final String categoryName;
//
//   final int categoryId;
//
//   @override
//   String toString() {
//     return 'ServiceWebRouteArgs{key: $key, categoryName: $categoryName, categoryId: $categoryId}';
//   }
// }
//
// /// generated route for
// /// [_i25.ServicesPage]
// class ServicesRoute extends _i32.PageRouteInfo<void> {
//   const ServicesRoute({List<_i32.PageRouteInfo>? children})
//       : super(
//           ServicesRoute.name,
//           initialChildren: children,
//         );
//
//   static const String name = 'ServicesRoute';
//
//   static const _i32.PageInfo<void> page = _i32.PageInfo<void>(name);
// }
//
// /// generated route for
// /// [_i26.SignUpPage]
// class SignUpRoute extends _i32.PageRouteInfo<SignUpRouteArgs> {
//   SignUpRoute({
//     _i33.Key? key,
//     required String phoneNumber,
//     List<_i32.PageRouteInfo>? children,
//   }) : super(
//           SignUpRoute.name,
//           args: SignUpRouteArgs(
//             key: key,
//             phoneNumber: phoneNumber,
//           ),
//           initialChildren: children,
//         );
//
//   static const String name = 'SignUpRoute';
//
//   static const _i32.PageInfo<SignUpRouteArgs> page =
//       _i32.PageInfo<SignUpRouteArgs>(name);
// }
//
// class SignUpRouteArgs {
//   const SignUpRouteArgs({
//     this.key,
//     required this.phoneNumber,
//   });
//
//   final _i33.Key? key;
//
//   final String phoneNumber;
//
//   @override
//   String toString() {
//     return 'SignUpRouteArgs{key: $key, phoneNumber: $phoneNumber}';
//   }
// }
//
// /// generated route for
// /// [_i27.SplashScreen]
// class SplashScreen extends _i32.PageRouteInfo<void> {
//   const SplashScreen({List<_i32.PageRouteInfo>? children})
//       : super(
//           SplashScreen.name,
//           initialChildren: children,
//         );
//
//   static const String name = 'SplashScreen';
//
//   static const _i32.PageInfo<void> page = _i32.PageInfo<void>(name);
// }
//
// /// generated route for
// /// [_i28.TaskCategoriesPage]
// class TaskCategoriesRoute extends _i32.PageRouteInfo<TaskCategoriesRouteArgs> {
//   TaskCategoriesRoute({
//     required String categoryName,
//     required int categoryId,
//     _i33.Key? key,
//     List<_i32.PageRouteInfo>? children,
//   }) : super(
//           TaskCategoriesRoute.name,
//           args: TaskCategoriesRouteArgs(
//             categoryName: categoryName,
//             categoryId: categoryId,
//             key: key,
//           ),
//           initialChildren: children,
//         );
//
//   static const String name = 'TaskCategoriesRoute';
//
//   static const _i32.PageInfo<TaskCategoriesRouteArgs> page =
//       _i32.PageInfo<TaskCategoriesRouteArgs>(name);
// }
//
// class TaskCategoriesRouteArgs {
//   const TaskCategoriesRouteArgs({
//     required this.categoryName,
//     required this.categoryId,
//     this.key,
//   });
//
//   final String categoryName;
//
//   final int categoryId;
//
//   final _i33.Key? key;
//
//   @override
//   String toString() {
//     return 'TaskCategoriesRouteArgs{categoryName: $categoryName, categoryId: $categoryId, key: $key}';
//   }
// }
//
// /// generated route for
// /// [_i29.UsernameSelectionPage]
// class UsernameSelectionRoute
//     extends _i32.PageRouteInfo<UsernameSelectionRouteArgs> {
//   UsernameSelectionRoute({
//     _i33.Key? key,
//     required _i36.UserModel user,
//     List<_i32.PageRouteInfo>? children,
//   }) : super(
//           UsernameSelectionRoute.name,
//           args: UsernameSelectionRouteArgs(
//             key: key,
//             user: user,
//           ),
//           initialChildren: children,
//         );
//
//   static const String name = 'UsernameSelectionRoute';
//
//   static const _i32.PageInfo<UsernameSelectionRouteArgs> page =
//       _i32.PageInfo<UsernameSelectionRouteArgs>(name);
// }
//
// class UsernameSelectionRouteArgs {
//   const UsernameSelectionRouteArgs({
//     this.key,
//     required this.user,
//   });
//
//   final _i33.Key? key;
//
//   final _i36.UserModel user;
//
//   @override
//   String toString() {
//     return 'UsernameSelectionRouteArgs{key: $key, user: $user}';
//   }
// }
//
// /// generated route for
// /// [_i30.WebCartPage]
// class WebCartRoute extends _i32.PageRouteInfo<WebCartRouteArgs> {
//   WebCartRoute({
//     _i33.Key? key,
//     required bool isLoading,
//     required _i37.ServiceModel service,
//     required int categoryId,
//     required bool isFromPackage,
//     required int? optionId,
//     required int? packageId,
//     required bool canEditAddons,
//     int? packageBookingId,
//     required _i38.UserDetailsModel userData,
//     required bool isPackageServiceBooking,
//     List<_i32.PageRouteInfo>? children,
//   }) : super(
//           WebCartRoute.name,
//           args: WebCartRouteArgs(
//             key: key,
//             isLoading: isLoading,
//             service: service,
//             categoryId: categoryId,
//             isFromPackage: isFromPackage,
//             optionId: optionId,
//             packageId: packageId,
//             canEditAddons: canEditAddons,
//             packageBookingId: packageBookingId,
//             userData: userData,
//             isPackageServiceBooking: isPackageServiceBooking,
//           ),
//           initialChildren: children,
//         );
//
//   static const String name = 'WebCartRoute';
//
//   static const _i32.PageInfo<WebCartRouteArgs> page =
//       _i32.PageInfo<WebCartRouteArgs>(name);
// }
//
// class WebCartRouteArgs {
//   const WebCartRouteArgs({
//     this.key,
//     required this.isLoading,
//     required this.service,
//     required this.categoryId,
//     required this.isFromPackage,
//     required this.optionId,
//     required this.packageId,
//     required this.canEditAddons,
//     this.packageBookingId,
//     required this.userData,
//     required this.isPackageServiceBooking,
//   });
//
//   final _i33.Key? key;
//
//   final bool isLoading;
//
//   final _i37.ServiceModel service;
//
//   final int categoryId;
//
//   final bool isFromPackage;
//
//   final int? optionId;
//
//   final int? packageId;
//
//   final bool canEditAddons;
//
//   final int? packageBookingId;
//
//   final _i38.UserDetailsModel userData;
//
//   final bool isPackageServiceBooking;
//
//   @override
//   String toString() {
//     return 'WebCartRouteArgs{key: $key, isLoading: $isLoading, service: $service, categoryId: $categoryId, isFromPackage: $isFromPackage, optionId: $optionId, packageId: $packageId, canEditAddons: $canEditAddons, packageBookingId: $packageBookingId, userData: $userData, isPackageServiceBooking: $isPackageServiceBooking}';
//   }
// }
//
// /// generated route for
// /// [_i31.YourBookingPlanePage]
// class YourBookingPlaneRoute extends _i32.PageRouteInfo<void> {
//   const YourBookingPlaneRoute({List<_i32.PageRouteInfo>? children})
//       : super(
//           YourBookingPlaneRoute.name,
//           initialChildren: children,
//         );
//
//   static const String name = 'YourBookingPlaneRoute';
//
//   static const _i32.PageInfo<void> page = _i32.PageInfo<void>(name);
// }
