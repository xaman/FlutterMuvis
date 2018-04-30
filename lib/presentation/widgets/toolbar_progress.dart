import 'package:flutter/material.dart';

const double _SIZE = 20.0;
const double _PADDING = 10.0;
const double _STROKE_WIDTH = 2.5;

class ToolbarProgress extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Center(
      child: new Padding(
        padding: new EdgeInsets.all(_PADDING),
        child: new SizedBox(
          width: _SIZE,
          height: _SIZE,
          child: new Theme(
            data: Theme.of(context).copyWith(accentColor: Colors.white),
            child: new CircularProgressIndicator(
              strokeWidth: _STROKE_WIDTH,
            )
          )
        )
      )
    );
  }

}