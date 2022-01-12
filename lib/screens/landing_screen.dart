import 'package:flutter/material.dart';
import 'package:flutter_anime_demo/custom/border_box.dart';
import 'package:flutter_anime_demo/custom/option_button.dart';
import 'package:flutter_anime_demo/data/sample_data.dart';
import 'package:flutter_anime_demo/utils/constants.dart';
import 'package:flutter_anime_demo/utils/custom_functions.dart';
import 'package:flutter_anime_demo/utils/widget_functions.dart';

class LandingScreen extends StatelessWidget {
  const LandingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final ThemeData themeData = Theme.of(context);
    final double padding = 25.0;
    final EdgeInsets sidePadding = EdgeInsets.symmetric(horizontal: padding);
    return SafeArea(
      child: Scaffold(
          body: SizedBox(
              width: size.width,
              height: size.height,
              child: Stack(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      addVerticalSpace(padding),
                      Padding(
                        padding: sidePadding,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: const [
                            BorderBox(
                                child: Icon(Icons.menu, color: COLOR_BLACK),
                                width: 50,
                                height: 50),
                            BorderBox(
                                child: Icon(Icons.settings, color: COLOR_BLACK),
                                width: 50,
                                height: 50),
                          ],
                        ),
                      ),
                      addVerticalSpace(padding),
                      Padding(
                        padding: sidePadding,
                        child:
                            Text('City', style: themeData.textTheme.bodyText2),
                      ),
                      Padding(
                        padding: sidePadding,
                        child: Text('San Francisco',
                            style: themeData.textTheme.headline1),
                      ),
                      addVerticalSpace(10),
                      SingleChildScrollView(
                        physics: BouncingScrollPhysics(),
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: const [
                            ChoiceOption(text: 'Hello'),
                            ChoiceOption(text: 'World'),
                            ChoiceOption(text: 'Flutter'),
                            ChoiceOption(text: 'Flutter'),
                            ChoiceOption(text: 'Flutter'),
                            ChoiceOption(text: 'Flutter'),
                            ChoiceOption(text: 'Flutter'),
                          ],
                        ),
                      ),
                      addVerticalSpace(10),
                      Expanded(
                        child: Padding(
                          padding: sidePadding,
                          child: ListView.builder(
                              physics: BouncingScrollPhysics(),
                              itemCount: RE_DATA.length,
                              itemBuilder: (context, index) {
                                return AnimeItem(
                                  itemData: RE_DATA[index],
                                );
                              }),
                        ),
                      )
                    ],
                  ),
                  Positioned(
                      bottom: 20,
                      width: size.width,
                      child: Center(
                        child: OptionButton(
                            icon: Icons.map_rounded,
                            text: 'Map View',
                            width: size.width * 0.35),
                      ))
                ],
              ))),
    );
  }
}

class AnimeItem extends StatelessWidget {
  final dynamic itemData;
  const AnimeItem({Key? key, required this.itemData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              ClipRRect(
                  borderRadius: BorderRadius.circular(25.0),
                  child: Image.asset(
                    itemData['image'],
                    width: 300,
                  )),
              const Positioned(
                top: 15,
                right: 15,
                child: BorderBox(
                  child: Icon(Icons.favorite_border, color: COLOR_BLACK),
                  width: 50,
                  height: 50,
                ),
              ),
            ],
          ),
          addVerticalSpace(15),
          Row(
            children: [
              Text(
                formatCurrency(itemData['amount']),
                style: themeData.textTheme.headline1,
              ),
              addHorizontalSpace(10),
              Text('${itemData['address']}',
                  style: themeData.textTheme.bodyText2)
            ],
          ),
          addVerticalSpace(10),
          Text(
              '${itemData['bedrooms']} bedrooms / ${itemData['bathrooms']} bathrooms',
              style: themeData.textTheme.headline5)
        ],
      ),
    );
  }
}

class ChoiceOption extends StatelessWidget {
  const ChoiceOption({Key? key, required this.text}) : super(key: key);
  final String text;

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);
    return Container(
      margin: EdgeInsets.only(left: 25),
      child: Chip(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 13),
        label: Text(
          text,
          style: themeData.textTheme.headline5,
        ),
        backgroundColor: COLOR_GREY.withAlpha(25),
      ),
    );
  }
}
