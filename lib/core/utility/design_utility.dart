import 'package:flutter/material.dart';

Widget horizontalSpaceSuperTiny = const SizedBox(width: 2.0);
Widget horizontalSpaceTiny = const SizedBox(width: 4.0);
Widget horizontalSpaceSmall = const SizedBox(width: 8.0);
Widget horizontalSpaceLessThenRegular = const SizedBox(width: 12.0);
Widget horizontalSpaceRegular = const SizedBox(width: 16.0);
Widget horizontalSpaceMedium = const SizedBox(width: 24.0);
Widget horizontalSpaceMediumLarge = const SizedBox(width: 32.0);
Widget horizontalSpaceSemiLarge = const SizedBox(width: 40.0);
Widget horizontalSpaceLarge = const SizedBox(width: 50.0);
Widget horizontalSpaceExtraLarge = const SizedBox(width: 70.0);

Widget verticalSpaceSuperTiny = const SizedBox(height: 2.0);
Widget verticalSpaceTop = const SizedBox(height: 22.0);
Widget verticalSpaceTiny = const SizedBox(height: 4.0);
Widget verticalSpaceSmall = const SizedBox(height: 8.0);
Widget verticalSpaceLessThanRegular = const SizedBox(height: 12.0);
Widget verticalSpaceRegular = const SizedBox(height: 16.0);
Widget verticalSpaceMoreThanRegular = const SizedBox(height: 20.0);
Widget verticalSpaceMedium = const SizedBox(height: 24.0);
Widget verticalSpaceMediumLarge = const SizedBox(height: 32.0);
Widget verticalSpaceSemiLarge = const SizedBox(height: 40.0);
Widget verticalSpaceLarge = const SizedBox(height: 50.0);
Widget verticalSpaceLargest = const SizedBox(height: 60.0);
Widget verticalSpaceLarge80 = const SizedBox(height: 80.0);
Widget verticalSpaceLarge100 = const SizedBox(height: 100.0);
Widget verticalSpaceLarge120 = const SizedBox(height: 120.0);
Widget verticalSpaceLarge200 = const SizedBox(height: 200.0);

// Screen Size helpers

double screenWidth(BuildContext context) => MediaQuery.of(context).size.width;
double screenHeight(BuildContext context) => MediaQuery.of(context).size.height;
