import 'package:flutter/material.dart';
import 'package:flutter_anime_demo/custom/border_box.dart';
import 'package:flutter_anime_demo/utils/constants.dart';

class DetailsScreen extends StatelessWidget {
  final dynamic itemData;

  const DetailsScreen({Key? key, required this.itemData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);
    return SafeArea(
      child: Container(
          // TODO: Change content padding value to constant
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          height: 250,
          decoration: BoxDecoration(
            // TODO: Set default image color
            color: Colors.greenAccent,
            image: DecorationImage(
                image: AssetImage(
                  itemData['image'],
                ),
                // alignment: Alignment(-.7, 0),
                fit: BoxFit.cover),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: 50,
                    height: 50,
                    child: GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: const Icon(Icons.arrow_back_ios_sharp,
                          // TODO: Work with colors
                          color: COLOR_WHITE),
                    ),
                  ),
                  const BorderBox(
                    // TODO: Work with colors
                    child: Icon(Icons.bookmark_add, color: COLOR_BLACK),
                    width: 50,
                    height: 50,
                  ),
                ],
              ),
              ClipRRect(
                borderRadius: BorderRadius.circular(30),
                child: Container(
                  padding:
                      EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
                  decoration: BoxDecoration(
                      gradient:
                          LinearGradient(begin: Alignment.bottomRight, colors: [
                    Colors.black.withOpacity(1),
                    Colors.black.withOpacity(.7),
                  ])),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
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
              )
            ],
          )),
    );
  }
}
