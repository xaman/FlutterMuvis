import 'package:flutter/material.dart';

import 'package:fluttermuvis/domain/model/movie.dart';
import 'package:fluttermuvis/presentation/res/theme_colors.dart';
import 'package:fluttermuvis/presentation/widgets/movie_item.dart';


const double _ITEM_MAX_WIDTH = 150.0;
const double _ITEM_ASPECT_RATIO = 100/200;

class MoviesGridView extends StatelessWidget {

  final List<Movie> _movies;
  final OnMovieClickListener _onMovieClick;

  MoviesGridView(this._movies, this._onMovieClick);

  @override
  Widget build(BuildContext context) {
    return new Container(
      color: ThemeColors.lime,
      child: new GridView.extent(
        maxCrossAxisExtent: _ITEM_MAX_WIDTH,
        childAspectRatio: _ITEM_ASPECT_RATIO,
        children: new List.generate(_movies.length, (index) {
          return new MovieItem(_movies[index], _onMovieClick);
        }),
      )
    );
  }

}