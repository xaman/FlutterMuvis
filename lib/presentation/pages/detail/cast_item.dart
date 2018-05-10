import 'package:flutter/material.dart';

import 'package:cached_network_image/cached_network_image.dart';

import 'package:fluttermuvis/domain/model/cast.dart';
import 'package:fluttermuvis/presentation/res/theme_colors.dart';
import 'package:fluttermuvis/presentation/res/drawables.dart';

const double _PICTURE_WIDTH = 100.0;
const double _TEXT_WIDTH = 90.0;
const double _PICTURE_HEIGHT = 120.0;
const double _FONT_SIZE = 13.0;
const double _EXTERNAL_PADDING = 2.5;
const double _INTERNAL_PADDING = 5.0;

class CastItem extends StatelessWidget {

  final Cast _cast;

  CastItem(this._cast);

  @override
  Widget build(BuildContext context) {
    return new Padding(
      child: new Card(
        color: Colors.white,
        child: new Column(
          children: <Widget>[
            new CachedNetworkImage(
              imageUrl: _cast.profilePath,
              height: _PICTURE_HEIGHT,
              width: _PICTURE_WIDTH,
              fit: BoxFit.cover,
              placeholder: _createPlaceholder(),
              errorWidget: _createPlaceholder(),
            ),
            new Padding(
              padding: new EdgeInsets.all(_INTERNAL_PADDING),
              child: new Column(
                children: <Widget>[
                  _createName(_cast.name),
                  _createCharacter(_cast.character)
                ],
              ),
            )
          ],
        ),
      ),
      padding: new EdgeInsets.all(_EXTERNAL_PADDING),
    );
  }

  Widget _createPlaceholder() {
    return new SizedBox(
      height: _PICTURE_HEIGHT,
      width: _PICTURE_WIDTH,
      child: new Image.asset(
        Drawables.DEFAULT_AVATAR,
        fit: BoxFit.cover,
        scale: 0.2,
      )
    );
  }

  Widget _createName(String name) => _createText(name, ThemeColors.concrete);

  Widget _createCharacter(String character) => _createText(character, ThemeColors.ash);

  Widget _createText(String value, Color color) {
    return new SizedBox(
      width: _TEXT_WIDTH,
      child: new Text(
        value,
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
        style: new TextStyle(
            color: color,
            fontSize: _FONT_SIZE
        ),
      ),
    );
  }

}