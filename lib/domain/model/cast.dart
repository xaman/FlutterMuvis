class Cast {

  String _character;
  String _name;
  String _profilePath;

  Cast(this._character, this._name, this._profilePath);

  String get profilePath => _profilePath ?? "";

  String get name => _name ?? "";

  String get character => _character ?? "";

  @override
  String toString() {
    return 'Cast{_character: $_character, _name: $_name, _profilePath: $_profilePath}';
  }


}