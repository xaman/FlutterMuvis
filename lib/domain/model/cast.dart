import 'package:fluttermuvis/config.dart';
import 'package:fluttermuvis/utils/strings.dart';

const String _PROFILE_PICTURE_SIZE = "w185";

class Cast {

  String _character;
  String _name;
  String _profilePath;

  Cast(this._character, this._name, this._profilePath);

  String get name => _name ?? "";

  String get character => _character ?? "";

  String get profilePath {
    return Strings.notNullOrEmpty(_profilePath) ?
      Config.PICTURE_URL + _PROFILE_PICTURE_SIZE + _profilePath :
      "";
  }

  @override
  String toString() {
    return 'Cast{_character: $_character, _name: $_name, _profilePath: $_profilePath}';
  }


}