import 'package:flutter/material.dart';
import 'package:pokedex/routes.dart';

const double mainAppbarPadding = 28;

class MainSliverAppBar extends SliverAppBar {
  static const TextStyle _textStyle = TextStyle(
    fontWeight: FontWeight.bold,
    fontSize: kToolbarHeight / 3,
    height: 1,
  );

  MainSliverAppBar({
    GlobalKey? appBarKey,
    String title = 'Pokedex',
    double height = kToolbarHeight + mainAppbarPadding * 2,
    double expandedFontSize = 30,
    void Function()? onLeadingPress = AppNavigator.pop,
    void Function()? onTrailingPress,
    required BuildContext context,
  }) : super(
          centerTitle: true,
          expandedHeight: height,
          floating: false,
          pinned: true,
          backgroundColor: Colors.transparent,
          elevation: 0,
        );
}
