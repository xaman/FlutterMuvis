import 'dart:async';

import 'package:flutter/material.dart';

import 'package:fluttermuvis/presentation/pages/home_page.dart';
import 'package:fluttermuvis/presentation/res/drawables.dart';


class SplashPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    _navigateToHomeAfterDelay(context);
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