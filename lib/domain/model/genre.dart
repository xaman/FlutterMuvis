class Genre {

  int _id;
  String _name;

  Genre(this._id, this._name);

  String get name => _name ?? "";

  int get id => _id;

  @override
  String toString() {
    return 'Genre{_id: $_id, _name: $_name}';
  }

}