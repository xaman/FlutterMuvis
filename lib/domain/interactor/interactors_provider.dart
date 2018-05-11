import 'package:fluttermuvis/data/data_provider.dart';
import 'package:fluttermuvis/domain/interactor/get_movies.dart';
import 'package:fluttermuvis/domain/interactor/get_detail.dart';
import 'package:fluttermuvis/domain/interactor/get_credits.dart';
import 'package:fluttermuvis/domain/interactor/set_favorite.dart';

class InteractorsProvider {

  static final _repository = DataProvider.getRepository();

  static GetMovies getMoviesInteractor() {
    return new GetMovies(_repository);
  }

  static GetDetail getDetailInteractor() {
    return new GetDetail(_repository);
  }

  static GetCredits getCreditsInteractor() {
    return new GetCredits(_repository);
  }

  static SetFavorite getFavoriteInteractor() {
    return new SetFavorite(_repository);
  }

}