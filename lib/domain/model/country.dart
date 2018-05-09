class Country {

  String _iso;
  String _name;

  Country(this._iso, this._name);

  String get name => _name ?? "";

  String get iso => _iso ?? "";

  @override
  String toString() {
    return 'Country{_iso: $_iso, _name: $_name}';
  }

}