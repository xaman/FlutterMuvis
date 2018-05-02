import 'package:flutter/material.dart';

import 'package:fluttermuvis/presentation/res/theme_colors.dart';
import 'package:fluttermuvis/presentation/res/drawables.dart';


const double _ICON_HEIGHT = 20.0;


class HomeBottomNavigationBar extends StatelessWidget {

  final int _selectedPosition;
  final OnItemSelected _onItemSelected;

  HomeBottomNavigationBar(this._selectedPosition, this._onItemSelected);

  @override
  Widget build(BuildContext context) {
    return new BottomNavigationBar(
      currentIndex: _selectedPosition,
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
        color: position == _selectedPosition ? Colors.white : Colors.white70,
      ),
      title: new Text(text),
      backgroundColor: ThemeColors.strawberry,
    );
  }

  void _handleItemTap(int position) => _onItemSelected(position);

}

typedef void OnItemSelected(int index);