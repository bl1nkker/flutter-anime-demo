import 'package:flutter/material.dart';
import 'package:flutter_anime_demo/custom/border_box.dart';
import 'package:flutter_anime_demo/custom/option_button.dart';
import 'package:flutter_anime_demo/data/sample_data.dart';
import 'package:flutter_anime_demo/screens/details_screen.dart';
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
                            style: themeData.textTheme.headline2),
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
                                  tag: RE_DATA[index]['address'] as String,
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
                            icon: Icons.bookmark,
                            text: 'Bookmarked',
                            width: size.width * 0.35),
                      ))
                ],
              ))),
    );
  }
}

class AnimeItem extends StatelessWidget {
  final dynamic itemData;
  final String tag;
  const AnimeItem({Key? key, required this.itemData, required this.tag})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);
    return Hero(
        tag: tag,
        child: GestureDetector(
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => DetailsScreen(
                          itemData: itemData,
                        )));
          },
          child: Container(
            // TODO: Change content padding value to constant
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            margin: const EdgeInsets.only(bottom: 30.0),
            height: 250,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25.0),
                // TODO: Work with colors
                color: Colors.greenAccent,
                image: DecorationImage(
                    image: AssetImage(
                      itemData['image'],
                    ),
                    fit: BoxFit.cover),
                boxShadow: const [
                  BoxShadow(
                      color: Colors.grey, blurRadius: 10, offset: Offset(0, 5))
                ]),
            child: Stack(
              children: [
                const Positioned(
                  top: 0,
                  right: 0,
                  child: BorderBox(
                    // TODO: Work with colors
                    child: Icon(Icons.bookmark_add, color: COLOR_BLACK),
                    width: 50,
                    height: 50,
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Container(
                      // TODO: Work with colors
                      color: COLOR_GREY,
                      padding: const EdgeInsets.symmetric(horizontal: 5),
                      child: Text('Some anime name',
                          style: themeData.textTheme.headline1),
                    ),
                    const SizedBox(
                      height: 5.0,
                    ),
                    Container(
                      // TODO: Work with colors
                      color: COLOR_BLACK,
                      padding: const EdgeInsets.symmetric(horizontal: 5),
                      child: Text('Some anime name',
                          style: themeData.textTheme.headline6),
                    ),
                  ],
                )
              ],
            ),
          ),
        ));
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
        // TODO: Work with colors
        backgroundColor: COLOR_GREY.withAlpha(25),
      ),
    );
  }
}
