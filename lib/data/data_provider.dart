import 'package:fluttermuvis/data/cache.dart';
import 'package:fluttermuvis/data/movies_cache.dart';
import 'package:fluttermuvis/data/parser/parsers_provider.dart';
import 'package:fluttermuvis/data/repository.dart';
import 'package:fluttermuvis/data/repository_impl.dart';
import 'package:fluttermuvis/data/api.dart';
import 'package:fluttermuvis/domain/model/movie.dart';

class DataProvider {

  static Repository _repository;

  static Repository getRepository() {
    if (_repository == null) {
      _repository = new RepositoryImpl(_getApi(), _getCache());
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

  static Cache<Movie> _getCache() => new MoviesCache();

}