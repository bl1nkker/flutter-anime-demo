import 'package:flutter/material.dart';
import 'package:flutter_anime_demo/utils/constants.dart';

class BorderBox extends StatelessWidget {
  const BorderBox(
      {Key? key,
      this.padding,
      this.color,
      required this.onTap,
      required this.child,
      required this.width,
      required this.height})
      : super(key: key);
  final Widget child;
  final Function onTap;
  final EdgeInsets? padding;
  final Color? color;
  final double width, height;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onTap(),
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
            color: color ?? COLOR_WHITE,
            borderRadius: BorderRadius.circular(15),
            border: Border.all(color: COLOR_GREY.withAlpha(40), width: 2)),
        padding: padding ?? const EdgeInsets.all(8.0),
        child: Center(
          child: child,
        ),
      ),
    );
  }
}
