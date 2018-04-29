import 'get_movies.dart';

import '../../data/repository_provider.dart';

class InteractorsProvider {

  static GetMovies getMoviesInteractor() {
    return new GetMovies(RepositoryProvider.getRepository());
  }

}