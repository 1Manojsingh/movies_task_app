import 'package:flutter/material.dart';

class ConditionalPaddingColumn extends StatelessWidget {
  final CrossAxisAlignment crossAxisAlignment;
  final EdgeInsets padding;
  final List<Widget> children;
  final List<int> excludePaddingIndices;

  const ConditionalPaddingColumn({super.key,
    required this.crossAxisAlignment,
    required this.padding,
    required this.children,
    required this.excludePaddingIndices,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: crossAxisAlignment,
      children: children
          .asMap()
          .map((index, child) {
        return MapEntry(
          index,
          (excludePaddingIndices.contains(index))
              ? child
              : Padding(padding: padding, child: child),
        );
      })
          .values
          .toList(),
    );
  }
}