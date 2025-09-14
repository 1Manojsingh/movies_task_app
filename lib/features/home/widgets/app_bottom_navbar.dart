import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../../core/theme/app_colors.dart';



class AppBottomNavBar extends StatefulWidget {
  const AppBottomNavBar({
    super.key,
    required this.onPageChanged,
    required this.selectedPage,
  });

  final Function(int index) onPageChanged;
  final int selectedPage;

  @override
  State<AppBottomNavBar> createState() => _AppBottomNavBarState();
}

class _AppBottomNavBarState extends State<AppBottomNavBar> {
  final List<IconData> items = [
    Icons.home_outlined,
    Icons.search,
    Icons.person_outline,
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      decoration: const BoxDecoration(
        color: Colors.black,
        border: Border(
          top: BorderSide(color: Colors.grey, width: 0.5),
        ),
      ),
      child: SafeArea(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: List.generate(items.length, (index) {
            return Expanded(
              child: CupertinoButton(
                onPressed: () => widget.onPageChanged(index),
                padding: const EdgeInsets.symmetric(vertical: 8),
                child: Icon(
                  items[index],
                  size: 28,
                  color: widget.selectedPage == index ? AppColors.primary : Colors.white,
                ),
              ),
            );
          }),
        ),
      ),
    );
  }
}