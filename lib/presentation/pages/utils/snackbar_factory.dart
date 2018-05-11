import 'package:flutter/material.dart';

const int _SNACKBAR_DURATION = 500;

class SnackbarFactory {

  void show(BuildContext scaffoldContext, String text) {
    Scaffold.of(scaffoldContext).showSnackBar(
        new SnackBar(
          content: new Text(text),
          duration: new Duration(milliseconds: _SNACKBAR_DURATION),
        )
    );
  }

}