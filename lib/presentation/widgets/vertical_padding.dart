import 'package:flutter/material.dart';

class VerticalPadding extends StatelessWidget {

  final double _size;

  VerticalPadding(this._size);

  @override
  Widget build(BuildContext context) {
    return new Padding(padding: new EdgeInsets.only(bottom: _size));
  }

}