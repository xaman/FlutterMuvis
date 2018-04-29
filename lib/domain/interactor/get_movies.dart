import 'dart:async';

import 'interactor.dart';

import '../../data/repository.dart';

import '../model/movie.dart';

class GetMovies extends Interactor<List<Movie>> {

  Repository _repository;

  GetMovies(this._repository);

  @override
  Future<List<Movie>> execute() => _repository.getMovies();

}