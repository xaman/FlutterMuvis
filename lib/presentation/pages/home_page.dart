import 'package:flutter/material.dart';

import '../res/theme_colors.dart';
import '../res/drawables.dart';

import '../widgets/empty_view.dart';
import '../widgets/home_bottom_navigation_bar.dart';


const double _TOOLBAR_LOGO_HEIGHT = 30.0;

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        backgroundColor: ThemeColors.strawberry,
        title: new Image.asset(Drawables.TOOLBAR_LOGO, height: _TOOLBAR_LOGO_HEIGHT)
      ),
      body: new EmptyView(Drawables.IC_EMPTY_MOVIES, "Where are the movies?"),
      bottomNavigationBar: new HomeBottomNavigationBar(),
    );
  }

}