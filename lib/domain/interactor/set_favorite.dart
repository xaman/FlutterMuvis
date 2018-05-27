import 'dart:async';

import 'package:fluttermuvis/data/repository.dart';
import 'package:fluttermuvis/domain/interactor/interactor.dart';
import 'package:fluttermuvis/domain/model/movie.dart';

class SetFavorite extends Interactor<Movie> {

  Repository _repository;

  int id;

  SetFavorite(this._repository);

  @override
  Future<Movie> execute() => _repository.setFavorite(id);

}
