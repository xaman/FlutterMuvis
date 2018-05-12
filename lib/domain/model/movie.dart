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
  num _votesAverage;
  String _posterPath;
  String _backdropPath;
  bool _isFavorite;
  Detail _detail;

  Movie(this._id, this._title, this._originalTitle, this._originalLanguage,
      this._overview, this._releaseDate, this._forAdults, this._popularity,
      this._votesCount, this._votesAverage, this._posterPath,
      this._backdropPath, this._isFavorite, this._detail);

  int get id => _id;

  String get title => _title ?? "";

  String get originalTitle => _originalTitle ?? "";

  String get originalLanguage => _originalLanguage ?? "";

  String get overview => _overview ?? "";

  bool get forAdults => _forAdults;

  double get popularity => _popularity;

  int get votesCount => _votesCount;

  num get votesAverage => _votesAverage;

  bool get isFavorite => _isFavorite ?? false;

  Detail get detail => _detail;

  DateTime get releaseDate {
    try {
      return DateTime.parse(_releaseDate);
    } catch (exception) {}
    return null;
  }

  String get releaseYear {
    return releaseDate?.year?.toString() ?? "";
  }

  String get posterPath {
    return Config.PICTURE_URL + _POSTER_SIZE + _posterPath;
  }

  String getBackdropPath(BackdropSize size) {
    return Config.PICTURE_URL + size.value + _backdropPath;
  }

  Movie clone({id, title, originalTitle, originalLanguage, overview, releaseDate, forAdults, popularity, votesCount, votesAverage, posterPath, backdropPath, favorite, detail}) {
    return new Movie(
      id ?? _id,
      title ?? _title,
      originalTitle ?? _originalTitle,
      originalLanguage ?? _originalLanguage,
      overview ?? _overview,
      releaseDate ?? _releaseDate,
      forAdults ?? _forAdults,
      popularity ?? _popularity,
      votesCount ?? _votesCount,
      votesAverage ?? _votesAverage,
      posterPath ?? _posterPath,
      backdropPath ?? _backdropPath,
      favorite ?? _isFavorite,
      detail ?? _detail);
  }



  @override
  String toString() {
    return 'Movie{id: $id, title: $title, originalTitle: $originalTitle, originalLanguage: $originalLanguage, overview: $overview, releaseDate: $releaseDate, forAdults: $forAdults, popularity: $popularity, votesCount: $votesCount, votesAverage: $votesAverage, posterPath: $posterPath, isFavourite: $isFavorite, detail: $detail}';
  }

}