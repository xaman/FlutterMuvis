import 'package:flutter/material.dart';

import '../../domain/model/movie.dart';

import '../res/theme_colors.dart';
import '../res/drawables.dart';


const double _DESCRIPTION_PADDING = 10.0;
const double _TITLE_SIZE = 15.0;
const double _PADDING_BELOW_TITLE = 5.0;
const double _YEAR_SIZE = 12.0;
const double _RATING_ICON_SIZE = 18.0;
const int _MAX_TITLE_LINES = 2;

class MovieItemDetail extends StatelessWidget {

  final Movie _movie;

  MovieItemDetail(this._movie);

  @override
  Widget build(BuildContext context) {
    return new Expanded(
      child: new Padding(
        padding: new EdgeInsets.all(_DESCRIPTION_PADDING),
        child: new Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            new Text(_movie.title, maxLines: _MAX_TITLE_LINES, overflow: TextOverflow.ellipsis, style: _getTitleStyle(),),
            new Padding(padding: new EdgeInsets.only(bottom: _PADDING_BELOW_TITLE)),
            new Row(
              children: <Widget>[
                new Expanded(
                  child: new Text(_movie.releaseYear, style: _getYearStyle()),
                ),
                new Image.asset(Drawables.IC_MOVIE_RATING, height: _RATING_ICON_SIZE),
                new Text(_movie.votesAverage.toString(), style: _getRatingStyle())
              ],
            ),
          ],
        ),
      ),
    );
  }

  TextStyle _getTitleStyle() => new TextStyle(fontSize: _TITLE_SIZE, color: ThemeColors.concrete);

  TextStyle _getYearStyle() => new TextStyle(fontSize: _YEAR_SIZE, color: ThemeColors.ash);

  TextStyle _getRatingStyle() => new TextStyle(fontSize: _YEAR_SIZE, color: ThemeColors.strawberry);

}