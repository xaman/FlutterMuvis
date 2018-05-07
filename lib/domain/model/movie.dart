import 'package:fluttermuvis/domain/model/detail.dart';
import 'package:fluttermuvis/domain/model/backdrop_size.dart';
import 'package:fluttermuvis/config.dart';

const String _POSTER_SIZE = "w185";

class Movie {

  int _id;
  String _title;
  String _originalTitle;
  String _originalLanguage;
  String _overview;
  String _releaseDate;
  bool _forAdults;
  double _popularity;
  int _votesCount;
  double _votesAverage;
  String _posterPath;
  String _backdropPath;
  bool _isFavourite;
  Detail _detail;

  Movie(this._id, this._title, this._originalTitle, this._originalLanguage,
      this._overview, this._releaseDate, this._forAdults, this._popularity,
      this._votesCount, this._votesAverage, this._posterPath,
      this._backdropPath, this._isFavourite, this._detail);

  int get id => _id;

  String get title => _title;

  String get originalTitle => _originalTitle;

  String get originalLanguage => _originalLanguage;

  String get overview => _overview;

  DateTime get releaseDate {
    try {
      return DateTime.parse(_releaseDate);
    } catch (exception) {}
    return null;
  }

  String get releaseYear {
    return releaseDate != null ? releaseDate.year.toString() : "";
  }

  bool get forAdults => _forAdults;

  double get popularity => _popularity;

  int get votesCount => _votesCount;

  double get votesAverage => _votesAverage;

  bool get isFavourite => _isFavourite;

  Detail get detail => _detail;

  String get posterPath {
    return Config.PICTURE_URL + _POSTER_SIZE + _posterPath;
  }

  String getBackdropPath(BackdropSize size) {
    return Config.PICTURE_URL + size.value + _backdropPath;
  }

  @override
  String toString() {
    return 'Movie{id: $id, title: $title, originalTitle: $originalTitle, originalLanguage: $originalLanguage, overview: $overview, releaseDate: $releaseDate, forAdults: $forAdults, popularity: $popularity, votesCount: $votesCount, votesAverage: $votesAverage, posterPath: $posterPath, isFavourite: $isFavourite, detail: $detail}';
  }

}