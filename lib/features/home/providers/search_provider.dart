// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:task_pay/features/home/models/search_milestones_response.dart';
// import 'package:task_pay/features/home/models/search_people_response.dart';
// import 'package:task_pay/features/milestones/repositories/milestone_repository.dart';
//
// import '../models/search_milestones_response.dart';
//
// final searchPeopleProvider =
//     FutureProvider.autoDispose<List<People>>((ref) async {
//   final searchKeyword = ref.watch(mainSearchKeywordProvider).toLowerCase();
//   final res = await ref
//       .watch(milestoneRepositoryProvider)
//       .searchPeople(keyword: searchKeyword);
//   return res.fold((l) => throw l, (r) {
//     return r;
//   });
// });
//
// final mainSearchKeywordProvider =
//     StateProvider.autoDispose<String>((ref) => "");
//
// final searchMilestonesProvider =
//     FutureProvider.autoDispose<List<SearchMilestone>>((ref) async {
//   final searchKeyword = ref.watch(mainSearchKeywordProvider).toLowerCase();
//   final res = await ref
//       .watch(milestoneRepositoryProvider)
//       .searchMilestones(keyword: searchKeyword);
//   return res.fold((l) => throw l, (r) {
//     return r;
//   });
// });
