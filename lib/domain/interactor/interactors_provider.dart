import 'package:fluttermuvis/data/repository_provider.dart';
import 'package:fluttermuvis/domain/interactor/get_movies.dart';

class InteractorsProvider {

  static GetMovies getMoviesInteractor() {
    return new GetMovies(RepositoryProvider.getRepository());
  }

}