import 'package:flutter/material.dart';

class DetailsPanelWidget extends StatelessWidget {
  final ScrollController controller;
  const DetailsPanelWidget({Key? key, required this.controller})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);
    return ClipRRect(
      // borderRadius: BorderRadius.circular(30),
      child: Container(
        height: MediaQuery.of(context).size.height * .3,
        padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
        decoration: BoxDecoration(
            gradient: LinearGradient(begin: Alignment.bottomRight, colors: [
          Colors.black.withOpacity(1),
          // Colors.black.withOpacity(.3),
          Colors.black.withOpacity(.6),
        ])),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Hello world',
                style: themeData.textTheme.headline3,
              ),
              Text(
                'Rating Bar',
                style: themeData.textTheme.headline3,
              )
            ],
          ),
          const SizedBox(
            height: 10.0,
          ),
          Text(
              'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industrys standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.',
              style: themeData.textTheme.bodyText2),
        ]),
      ),
    );
  }
}
