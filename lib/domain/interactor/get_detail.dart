import 'dart:async';

import 'package:fluttermuvis/data/repository.dart';
import 'package:fluttermuvis/domain/interactor/interactor.dart';
import 'package:fluttermuvis/domain/model/detail.dart';

class GetDetail extends Interactor<Detail> {

  Repository _repository;

  GetDetail(this._repository);

  int id;

  @override
  Future<Detail> execute() => _repository.getDetail(id);

}