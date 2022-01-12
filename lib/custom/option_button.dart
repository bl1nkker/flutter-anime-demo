import 'package:flutter/material.dart';
import 'package:flutter_anime_demo/utils/constants.dart';
import 'package:flutter_anime_demo/utils/widget_functions.dart';

class OptionButton extends StatelessWidget {
  final String text;
  final IconData icon;
  final double width;
  const OptionButton(
      {Key? key, required this.text, required this.icon, required this.width})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
      width: width,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50), color: COLOR_DARK_BLUE),
      child: InkWell(
        onTap: () {},
        splashColor: COLOR_WHITE.withAlpha(55),
        child: Row(
          children: [
            Icon(icon, color: COLOR_WHITE),
            addHorizontalSpace(10),
            Text(
              text,
              style: const TextStyle(color: COLOR_WHITE),
            )
          ],
        ),
      ),
    );
  }
}
