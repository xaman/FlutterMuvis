import 'package:fluttermuvis/data/data_provider.dart';
import 'package:fluttermuvis/domain/interactor/get_movies.dart';
import 'package:fluttermuvis/domain/interactor/get_detail.dart';

class InteractorsProvider {

  static GetMovies getMoviesInteractor() {
    return new GetMovies(DataProvider.getRepository());
  }

  static GetDetail getDetailInteractor() {
    return new GetDetail(DataProvider.getRepository());
  }

}