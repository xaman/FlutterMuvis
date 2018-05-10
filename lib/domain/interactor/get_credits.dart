import 'dart:async';

import 'package:fluttermuvis/data/repository.dart';
import 'package:fluttermuvis/domain/interactor/interactor.dart';
import 'package:fluttermuvis/domain/model/cast.dart';

class GetCredits extends Interactor<List<Cast>> {

  Repository _repository;

  GetCredits(this._repository);

  int id = 1;

  @override
  Future<List<Cast>> execute() => _repository.getCredits(id);

}