import 'package:fluttermuvis/data/data_provider.dart';
import 'package:fluttermuvis/data/repository.dart';
import 'package:fluttermuvis/domain/interactor/get_movies.dart';
import 'package:fluttermuvis/domain/interactor/get_detail.dart';
import 'package:fluttermuvis/domain/interactor/get_credits.dart';

class InteractorsProvider {

  static GetMovies getMoviesInteractor() {
    return new GetMovies(_getRepository());
  }

  static GetDetail getDetailInteractor() {
    return new GetDetail(_getRepository());
  }

  static GetCredits getCreditsInteractor() {
    return new GetCredits(_getRepository());
  }

  static Repository _getRepository() => DataProvider.getRepository();

}