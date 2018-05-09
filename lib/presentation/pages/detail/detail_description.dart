import 'package:flutter/material.dart';

import 'package:fluttermuvis/domain/model/movie.dart';
import 'package:fluttermuvis/domain/model/detail.dart';
import 'package:fluttermuvis/presentation/res/theme_colors.dart';
import 'package:fluttermuvis/presentation/res/drawables.dart';
import 'package:fluttermuvis/presentation/widgets/poster_hero.dart';
import 'package:fluttermuvis/utils/strings.dart';

const double _DETAIL_PADDING = 10.0;
const double _POSTER_HEIGHT = 150.0;
const double _POSTER_WIDTH = 100.0;
const double _TITLE_SIZE = 22.0;
const double _INFO_SIZE = 14.0;
const double _HORIZONTAL_PADDING = 10.0;
const double _VERTICAL_PADDING = 5.0;
const double _RATING_STAR_SIZE = 22.0;
const double _RATING_FONT_SIZE = 18.0;

class DetailDescription extends StatelessWidget {

  final Movie _movie;
  final Detail _detail;

  DetailDescription(this._movie, this._detail);

  @override
  Widget build(BuildContext context) {
    return new SizedBox(
      child: new Padding(
        padding: new EdgeInsets.all(_DETAIL_PADDING),
        child: new Row(
          children: <Widget>[
            _createPoster(_movie.posterPath),
            _getHorizontalPadding(),
            new Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                _getTitle(context),
                _getVerticalPadding(),
                _getRating(),
                _getVerticalPadding(),
                _getInfo(context, _movie.releaseYear),
                _getVerticalPadding(),
                _getInfo(context, _detail?.runtime),
                _getVerticalPadding(),
                _getInfo(context, _detail?.genres),
                _getVerticalPadding(),
                _getInfo(context, _detail?.country)
              ],
            )
          ],
        ),
      )
    );
  }

  Widget _getTitle(BuildContext context) {
    return new SizedBox(
      width: _getTitleMaxWidth(context),
      child: new Text(
        _movie.title,
        style: new TextStyle(color: ThemeColors.concrete, fontSize: _TITLE_SIZE),
        maxLines: 2,
        overflow: TextOverflow.ellipsis,
      ),
    );
  }

  Widget _getInfo(BuildContext context, String value) {
    return new SizedBox(
        width: _getTitleMaxWidth(context),
        child: !Strings.isNullOrEmpty(value) ?
        new Text(value, style: new TextStyle(color: ThemeColors.ash, fontSize: _INFO_SIZE)) :
        new Container()
    );
  }

  Widget _getRating() {
    return new Row(
      children: <Widget>[
        new SizedBox(
          width: _RATING_STAR_SIZE,
          height: _RATING_STAR_SIZE,
          child: new Image.asset(Drawables.IC_MOVIE_RATING),
        ),
        new Padding(padding: new EdgeInsets.only(left: 5.0)),
        new Text(
          _movie.votesAverage.toString(),
          style: new TextStyle(color: ThemeColors.strawberry, fontSize: _RATING_FONT_SIZE),
        ),
      ],
    );
  }

  Widget _createPoster(String path) {
    return new Card(
      color: ThemeColors.silver,
      child: new SizedBox(
        width: _POSTER_WIDTH,
        height: _POSTER_HEIGHT,
        child: new Stack(
          children: <Widget>[
            new Image.asset(Drawables.DEFAULT_MOVIE),
            new PosterHero(_movie.posterPath),
          ]
        )
      )
    );
  }

  Widget _getVerticalPadding() {
    return new Padding(padding: new EdgeInsets.only(bottom: _VERTICAL_PADDING));
  }

  Widget _getHorizontalPadding() {
    return new Padding(padding: new EdgeInsets.only(left: _HORIZONTAL_PADDING));
  }

  double _getTitleMaxWidth(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return screenWidth - _POSTER_WIDTH - (2 * _DETAIL_PADDING) - _HORIZONTAL_PADDING - 10;
  }

}