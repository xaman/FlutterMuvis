import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

import 'package:fluttermuvis/domain/model/movie.dart';
import 'package:fluttermuvis/presentation/res/drawables.dart';
import 'package:fluttermuvis/presentation/pages/home/movie_item_description.dart';

const int _ANIMATION_DURATION = 100;

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
            new CachedNetworkImage(
              imageUrl: _movie.posterPath,
              placeholder: _getPosterPlaceHolder(),
              errorWidget: _getPosterPlaceHolder(),
              fadeOutDuration: new Duration(milliseconds: _ANIMATION_DURATION),
              fadeInDuration: new Duration(milliseconds: _ANIMATION_DURATION),
            ),
            new MovieItemDescription(_movie),
          ],
        ),
        onTap: () => _onMovieClick(_movie),
      )
    );
  }

  Widget _getPosterPlaceHolder() {
    return new Image.asset(Drawables.DEFAULT_MOVIE, fit: BoxFit.cover);
  }

}

typedef void OnMovieClickListener(Movie movie);