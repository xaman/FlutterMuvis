import 'package:flutter/material.dart';

import 'package:fluttermuvis/domain/model/movie.dart';
import 'package:fluttermuvis/presentation/res/drawables.dart';
import 'package:fluttermuvis/presentation/pages/home/movie_item_description.dart';
import 'package:fluttermuvis/presentation/widgets/poster_hero.dart';

class MovieItem extends StatelessWidget {

  final Movie _movie;
  final OnMovieClickListener _onMovieClick;

  MovieItem(this._movie, this._onMovieClick);

  @override
  Widget build(BuildContext context) {
    return new Card(
      child: new InkWell(
        child: new Column(
          children: <Widget>[
          new Stack(
            children: <Widget>[
              new Image.asset(Drawables.DEFAULT_MOVIE),
              new PosterHero(_movie.posterPath),
            ]
          ),
          new MovieItemDescription(_movie),
          ],
        ),
        onTap: () => _onMovieClick(_movie),
      )
    );
  }
}

typedef void OnMovieClickListener(Movie movie);