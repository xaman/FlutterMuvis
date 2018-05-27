import 'dart:async';

import 'package:fluttermuvis/data/repository.dart';
import 'package:fluttermuvis/domain/interactor/interactor.dart';
import 'package:fluttermuvis/domain/model/cast.dart';

class GetCredits extends Interactor<List<Cast>> {

  Repository _repository;

  int id;

  GetCredits(this._repository);

  @override
  Future<List<Cast>> execute() => _repository.getCredits(id);

}