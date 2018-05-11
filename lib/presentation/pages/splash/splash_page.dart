import 'dart:async';

import 'package:flutter/material.dart';

import 'package:fluttermuvis/presentation/pages/home/home_page.dart';
import 'package:fluttermuvis/presentation/res/drawables.dart';

const double _LOGO_WIDTH = 200.0;

class SplashPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    _navigateToHomeAfterDelay(context);
    return new Scaffold(
      body: new Material(
        color: Colors.red,
        child: new Stack(
          alignment: Alignment.center,
          children: <Widget>[
            _createBackground(),
            _createLogo()
          ],
        ),
      ),
    );
  }

  Widget _createBackground() {
    return new SizedBox.expand(
      child: new Image.asset(
        Drawables.SPLASH_BG,
        fit: BoxFit.cover,
        scale: 0.2,
      ),
    );
  }

  Widget _createLogo() {
    return new Image.asset(Drawables.SPLASH_LOGO, width: _LOGO_WIDTH);
  }

  void _navigateToHomeAfterDelay(BuildContext context) {
    new Future.delayed(new Duration(seconds: 2))
        .whenComplete(() => _navigateToHome(context));
  }

  void _navigateToHome(BuildContext context) {
    Navigator.of(context).pushAndRemoveUntil(
      new MaterialPageRoute(builder: (context) => new HomePage()),
      (route) => route == null
    );
  }

}