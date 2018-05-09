import 'package:flutter/material.dart';

import 'package:fluttermuvis/presentation/res/theme_colors.dart';

const double _OVERVIEW_SIZE = 16.0;
const double _OVERVIEW_PADDING = 15.0;
const int _OVERVIEW_COLLAPSED_LINES = 5;
const int _OVERVIEW_EXPANDED_LINES = 100;

class DetailOverview extends StatefulWidget {

  final String _text;

  DetailOverview(this._text);

  @override
  State<StatefulWidget> createState() => new _DetailOverviewState();
}

class _DetailOverviewState extends State<DetailOverview> {

  bool _isOverviewCollapsed = true;

  @override
  Widget build(BuildContext context) {
    return new InkWell(
        onTap: _onOverviewTap,
        child: new Padding(
          padding: new EdgeInsets.all(_OVERVIEW_PADDING),
          child: new Text(
            widget._text,
            maxLines: _getOverviewMaxLines(),
            overflow: TextOverflow.ellipsis,
            style: new TextStyle(
              color: ThemeColors.ash,
              fontSize: _OVERVIEW_SIZE,
            ),
          ),
        )
    );
  }

  void _onOverviewTap() {
    setState(() {
      _isOverviewCollapsed =! _isOverviewCollapsed;
    });
  }

  int _getOverviewMaxLines() {
    return _isOverviewCollapsed ? _OVERVIEW_COLLAPSED_LINES : _OVERVIEW_EXPANDED_LINES;
  }

}