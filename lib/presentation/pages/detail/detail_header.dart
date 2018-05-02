import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

import 'package:fluttermuvis/presentation/res/drawables.dart';
import 'package:fluttermuvis/presentation/res/theme_colors.dart';

const double _HEIGHT = 200.0;
const double _PADDING = 40.0;

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
        child: new CachedNetworkImage(
          imageUrl: _backdropPath,
          fit: BoxFit.cover,
          placeholder: new _DetailHeaderPlaceholder(),
          errorWidget: new _DetailHeaderPlaceholder(),
        ),
      ),
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