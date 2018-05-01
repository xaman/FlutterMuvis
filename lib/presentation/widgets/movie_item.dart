import 'package:flutter/material.dart';

import 'package:fluttermuvis/config.dart';
import 'package:fluttermuvis/domain/model/movie.dart';
import 'package:fluttermuvis/presentation/res/drawables.dart';
import 'package:fluttermuvis/presentation/widgets/movie_item_detail.dart';


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
            new Stack(
              children: <Widget>[
                new Image.asset(Drawables.DEFAULT_MOVIE),
                new Image.network(_getPictureUrl(), fit: BoxFit.cover, scale: 0.5),
              ],
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