import 'dart:async';

import 'package:fluttermuvis/data/repository.dart';
import 'package:fluttermuvis/domain/interactor/interactor.dart';
import 'package:fluttermuvis/domain/model/movie.dart';


class GetMovie extends Interactor<Movie> {

  GetMovie(this._repository);

  Repository _repository;

  int id;

  @override
  Future<Movie> execute() => _repository.getMovie(id);

}