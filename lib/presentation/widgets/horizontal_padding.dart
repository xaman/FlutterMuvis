import 'package:flutter/material.dart';

class HorizontalPadding extends StatelessWidget {

  final double _size;

  HorizontalPadding(this._size);

  @override
  Widget build(BuildContext context) {
    return new Padding(padding: new EdgeInsets.only(left: _size));
  }

}