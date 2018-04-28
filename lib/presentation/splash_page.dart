import 'package:flutter/material.dart';

import '../res/drawables.dart';

class SplashPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new Material(
        color: Colors.red,
        child: new Container(
          decoration: new BoxDecoration(
            image: new DecorationImage(
              image: AssetImage(Drawables.SPLASH_BG)
            ),
          ),
          child: new Center(
            child: new Image.asset(Drawables.SPLASH_LOGO, width: 200.0),
          ),
        ),
      ),
    );
  }
}