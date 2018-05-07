import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

import 'package:fluttermuvis/presentation/res/drawables.dart';
import 'package:fluttermuvis/presentation/res/theme_colors.dart';

const double _HEIGHT = 250.0;
const double _PADDING = 50.0;
const int _FADE_IN_DURATION = 300;

class DetailHeader extends StatelessWidget {

  final String _backdropPath;

  DetailHeader(this._backdropPath);

  @override
  Widget build(BuildContext context) {
    return new Stack(
      children: <Widget>[
        new SizedBox(
          width: MediaQuery.of(context).size.width,
          height: _HEIGHT,
          child: new Material(
          color: ThemeColors.silver,
          child: new CachedNetworkImage(
            imageUrl: _backdropPath,
            fit: BoxFit.cover,
            placeholder: new _DetailHeaderPlaceholder(),
            errorWidget: new _DetailHeaderPlaceholder(),
            fadeInDuration: new Duration(milliseconds: _FADE_IN_DURATION),
            ),
          ),
        ),
        new _DetailHeaderToolbar(),
      ],
    );
  }
}

class _DetailHeaderPlaceholder extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Padding(
        padding: new EdgeInsets.all(_PADDING),
        child: new Image.asset(Drawables.IC_EMPTY_MOVIES, fit: BoxFit.contain)
    );
  }
}

class _DetailHeaderToolbar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new AppBar(
      elevation: 0.0,
      backgroundColor: Colors.transparent,
      actions: <Widget>[
        new Icon(
          Icons.share,
          color: Colors.white,
        )
      ],
    );
  }
}