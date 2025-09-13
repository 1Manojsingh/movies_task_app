import 'package:flutter/material.dart';

class DefaultAppPadding extends StatelessWidget {
  const DefaultAppPadding({
    Key? key,
    this.child,
    this.padding,
  })  : onlyVertical = false,
        onlyHorizontal = false,
        super(key: key);

  const DefaultAppPadding.vertical({
    Key? key,
    this.child,
  })  : onlyVertical = true,
        onlyHorizontal = false,
        padding = null,
        super(key: key);

  const DefaultAppPadding.horizontal({
    Key? key,
    this.child,
  })  : onlyVertical = false,
        onlyHorizontal = true,
        padding = null,
        super(key: key);

  final Widget? child;
  final bool onlyVertical;
  final bool onlyHorizontal;
  final EdgeInsets? padding;

  static double defaultPadding = 24.0;

  @override
  Widget build(BuildContext context) {
    EdgeInsets cusPadding = padding ?? EdgeInsets.zero;
    if (padding == null) {
      if (onlyHorizontal) {
        cusPadding = EdgeInsets.symmetric(horizontal: defaultPadding);
      } else if (onlyVertical) {
        cusPadding = EdgeInsets.symmetric(vertical: defaultPadding);
      } else {
        cusPadding = EdgeInsets.all(defaultPadding);
      }
    }
    return Padding(
      padding: cusPadding,
      child: child,
    );
  }
}
