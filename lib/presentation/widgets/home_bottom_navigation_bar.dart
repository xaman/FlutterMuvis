import 'package:flutter/material.dart';

import '../res/theme_colors.dart';
import '../res/drawables.dart';


const double _ICON_HEIGHT = 20.0;


class HomeBottomNavigationBar extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new _HomeBottomNavigationBarState();
}

class _HomeBottomNavigationBarState extends State<HomeBottomNavigationBar> {

  int _currentIndex = 0;

  void _handleItemTap(int index) {
    this.setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return new BottomNavigationBar(
      currentIndex: _currentIndex,
      onTap: _handleItemTap,
      type: BottomNavigationBarType.shifting,
      items: [
        _createItem(0, "Movies", Drawables.IC_MOVIES),
        _createItem(1, "Favorites", Drawables.IC_FAVORITES)
      ]);
  }

  BottomNavigationBarItem _createItem(int position, String text, String asset) {
    return new BottomNavigationBarItem(
      icon: new Image.asset(
        asset,
        height: _ICON_HEIGHT,
        color: _currentIndex == position ? Colors.white : Colors.white70,
      ),
      title: new Text(text),
      backgroundColor: ThemeColors.strawberry,
    );
  }

}