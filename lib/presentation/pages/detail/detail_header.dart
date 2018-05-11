import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

import 'package:fluttermuvis/presentation/res/drawables.dart';
import 'package:fluttermuvis/presentation/res/theme_colors.dart';

const double _HEIGHT = 220.0;
const double _PADDING = 50.0;
const int _FADE_IN_DURATION = 100;

class DetailHeader extends StatelessWidget {

  final String _backdropPath;

  DetailHeader(this._backdropPath);

  @override
  Widget build(BuildContext context) {
    return new SizedBox(
      width: MediaQuery.of(context).size.width,
      height: _HEIGHT,
      child: new Material(
        color: ThemeColors.silver,
        child: _createBackdrop(),
      )
    );
  }

  Widget _createBackdrop() {
    return new CachedNetworkImage(
      imageUrl: _backdropPath,
      fit: BoxFit.cover,
      placeholder: _createPlaceholder(),
      errorWidget: _createPlaceholder(),
      fadeOutDuration: new Duration(milliseconds: _FADE_IN_DURATION),
      fadeInDuration: new Duration(milliseconds: _FADE_IN_DURATION),
    );
  }

  Widget _createPlaceholder() {
    return new Padding(
      padding: new EdgeInsets.all(_PADDING),
      child: new Image.asset(Drawables.IC_EMPTY_MOVIES, fit: BoxFit.contain)
    );
  }

}