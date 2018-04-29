import 'package:flutter/material.dart';

import '../res/theme_colors.dart';

const double _ICON_HEIGHT = 100.0;
const double _PADDING = 20.0;
const double _FONT_SIZE = 20.0;

class EmptyView extends StatelessWidget {

  final String iconAsset;
  final String message;

  EmptyView(this.iconAsset, this.message);

  @override
  Widget build(BuildContext context) {
    return new Material(
      color: ThemeColors.lime,
      child: new Center(
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            new Image.asset(
              iconAsset,
              height: _ICON_HEIGHT,
            ),
            new Padding(padding: new EdgeInsets.only(bottom: _PADDING)),
            new Text(
              message,
              style: new TextStyle(color: ThemeColors.ash, fontSize: _FONT_SIZE),
            )
          ],
        ),
      ),
    );
  }
}