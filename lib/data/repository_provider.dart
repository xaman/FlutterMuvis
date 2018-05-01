import 'package:fluttermuvis/data/repository.dart';
import 'package:fluttermuvis/data/api.dart';

class RepositoryProvider {

  static Repository _repository;

  static Repository getRepository() {
    if (_repository == null) {
      _repository = new Repository(new Api());
    }
    return _repository;
  }

}