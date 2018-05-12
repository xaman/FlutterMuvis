import 'package:fluttermuvis/data/parser/parsers_provider.dart';
import 'package:fluttermuvis/data/repository.dart';
import 'package:fluttermuvis/data/repository_impl.dart';
import 'package:fluttermuvis/data/api.dart';

class DataProvider {

  static Repository _repository;

  static Repository getRepository() {
    if (_repository == null) {
      _repository = new RepositoryImpl(_getApi());
    }
    return _repository;
  }

  static Api _getApi() {
    return new Api(
      ParsersProvider.getMoviesParser(),
      ParsersProvider.getDetailParser(),
      ParsersProvider.getCreditsParser()
    );
  }

}