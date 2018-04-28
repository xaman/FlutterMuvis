import 'package:flutter/material.dart';


class SplashPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Material(
      color: Colors.red,
      child: new Container(
        child: new Center(
          child: new Icon(Icons.face),
        ),
      ),
    );
  }

}