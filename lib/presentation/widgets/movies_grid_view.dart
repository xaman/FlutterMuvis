import 'package:flutter/material.dart';

import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

import 'movie_item.dart';

import '../../domain/model/movie.dart';

const int _NUM_COLUMNS = 3;
const double _SPACING = 2.0;
const double _ITEM_HEIGHT = 280.0;

class MoviesGridView extends StatelessWidget {

  final List<Movie> _movies;
  final OnMovieClickListener _onMovieClick;

  MoviesGridView(this._movies, this._onMovieClick);

  @override
  Widget build(BuildContext context) {
    return new StaggeredGridView.countBuilder(
      crossAxisCount: _NUM_COLUMNS,
      scrollDirection: Axis.vertical,
      mainAxisSpacing: _SPACING,
      crossAxisSpacing: _SPACING,
      padding: new EdgeInsets.all(_SPACING),
      itemCount: _movies.length,
      itemBuilder: (context, index) => new MovieItem(_movies[index], _onMovieClick),
      staggeredTileBuilder: (index) => new StaggeredTile.extent(1, _ITEM_HEIGHT),
    );
  }

}