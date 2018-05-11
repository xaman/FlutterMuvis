import 'package:flutter/material.dart';

class PosterHero extends StatelessWidget {

  final String _path;

  PosterHero(this._path);

  @override
  Widget build(BuildContext context) {
    return new Hero(
      tag: _path,
      child: new Image.network(
        _path,
        fit: BoxFit.cover,
        scale: 0.2
      )
    );
  }
}