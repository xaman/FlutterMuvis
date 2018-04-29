import 'package:flutter/material.dart';

import '../../domain/model/movie.dart';

import '../../config.dart';

import '../res/theme_colors.dart';

import 'movie_item_detail.dart';


const String _PICTURE_SIZE = "w185";

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
            new Expanded(
              child: new Image.network(_getPictureUrl(), fit: BoxFit.cover)
            ),
            new MovieItemDetail(_movie),
          ],
        ),
        onTap: () => _onMovieClick(_movie),
      )
    );
  }

  String _getPictureUrl() => Config.PICTURE_URL + _PICTURE_SIZE + _movie.posterPath;

}

typedef void OnMovieClickListener(Movie movie);