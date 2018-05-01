import 'dart:async';

import 'package:fluttermuvis/data/repository.dart';
import 'package:fluttermuvis/domain/interactor/interactor.dart';
import 'package:fluttermuvis/domain/model/movie.dart';

class GetMovies extends Interactor<List<Movie>> {

  Repository _repository;

  GetMovies(this._repository);

  int page = 1;

  @override
  Future<List<Movie>> execute() => _repository.getMovies(page);

}