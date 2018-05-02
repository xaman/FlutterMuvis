import 'package:flutter/material.dart';

import 'package:fluttermuvis/domain/model/movie.dart';
import 'package:fluttermuvis/presentation/res/theme_colors.dart';
import 'package:fluttermuvis/presentation/pages/home/movie_item.dart';


const double _ITEM_MAX_WIDTH = 150.0;
const double _ITEM_ASPECT_RATIO = 100/200;
const double _OFFSET_TO_REFRESH = 1000.0;

class MoviesGridView extends StatelessWidget {

  final double _initialScrollOffset;
  final List<Movie> _movies;
  final OnMovieClickListener _onMovieClick;
  final OnScrollChange _onScrollChange;
  final VoidCallback _onListBottom;

  MoviesGridView(
    this._movies,
    this._onMovieClick,
    this._initialScrollOffset,
    this._onScrollChange,
    this._onListBottom
  );

  @override
  Widget build(BuildContext context) {
    return new Container(
      color: ThemeColors.lime,
      child: new NotificationListener(
        onNotification: _handleScrollChange,
        child: new GridView.extent(
          controller: new ScrollController(initialScrollOffset: _initialScrollOffset),
          maxCrossAxisExtent: _ITEM_MAX_WIDTH,
          childAspectRatio: _ITEM_ASPECT_RATIO,
          children: new List.generate(_movies.length, (index) {
            return new MovieItem(_movies[index], _onMovieClick);
          }),
        )
      )
    );
  }

  bool _handleScrollChange(Notification notification) {
    if (notification is ScrollUpdateNotification) {
      ScrollMetrics metrics = notification.metrics;
      num pixelsToEnd = metrics.maxScrollExtent - metrics.pixels;
      _onScrollChange(metrics.pixels);
      if (pixelsToEnd < _OFFSET_TO_REFRESH) _onListBottom();
      return true;
    }
    return false;
  }

}

typedef void OnScrollChange(double offset);