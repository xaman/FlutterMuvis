import 'package:fluttermuvis/domain/model/genre.dart';
import 'package:fluttermuvis/domain/model/country.dart';

class Detail {

  int _budget;
  String _homepage;
  String _imdbId;
  String _originalLanguage;
  String _originalTitle;
  String _overview;
  int _runtime;
  List<Genre> _genres;
  List<Country> _countries;

  Detail(this._budget, this._homepage, this._imdbId, this._originalLanguage,
      this._originalTitle, this._overview, this._runtime, this._genres,
      this._countries);

  List<Country> get countries => _countries;

  List<Genre> get genres => _genres;

  int get runtime => _runtime;

  String get overview => _overview;

  String get originalTitle => _originalTitle;

  String get originalLanguage => _originalLanguage;

  String get imdbId => _imdbId;

  String get homepage => _homepage;

  int get budget => _budget;

  @override
  String toString() {
    return 'Detail{_budget: $_budget, _homepage: $_homepage, _imdbId: $_imdbId, _originalLanguage: $_originalLanguage, _originalTitle: $_originalTitle, _overview: $_overview, _runtime: $_runtime, _genres: $_genres, _countries: $_countries}';
  }


}