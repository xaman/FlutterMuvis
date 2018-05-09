import 'dart:async';

import 'package:flutter/material.dart';

import 'package:fluttermuvis/domain/interactor/interactors_provider.dart';
import 'package:fluttermuvis/domain/interactor/get_detail.dart';
import 'package:fluttermuvis/domain/model/movie.dart';
import 'package:fluttermuvis/domain/model/detail.dart';
import 'package:fluttermuvis/domain/model/backdrop_size.dart';
import 'package:fluttermuvis/presentation/res/theme_colors.dart';
import 'package:fluttermuvis/presentation/pages/detail/detail_header.dart';
import 'package:fluttermuvis/presentation/pages/detail/detail_description.dart';

const double _OVERVIEW_SIZE = 18.0;
const double _OVERVIEW_PADDING = 15.0;
const int _OVERVIEW_COLLAPSED_LINES = 5;
const int _OVERVIEW_EXPANDED_LINES = 100;
const int _BIG_BACKDROP_DELAY = 1000;

class DetailPage extends StatefulWidget {

  final Movie _movie;

  DetailPage(this._movie);

  @override
  State<StatefulWidget> createState() => new _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {

  BuildContext _scaffoldContext;
  bool _isOverviewCollapsed = true;
  BackdropSize _backdropSize = BackdropSize.SMALL;

  @override
  void initState() {
    super.initState();
    _loadDetail();
    _loadBigBackdropWithDelay();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      backgroundColor: ThemeColors.lime,
      body: new Builder(builder: (context) {
        _scaffoldContext = context;
        return new SingleChildScrollView(
          child: new Column(
            children: <Widget>[
              new DetailHeader(widget._movie.getBackdropPath(_backdropSize)),
              new DetailDescription(widget._movie),
              _getOverview(),
            ],
          ),
        );
      })
    );
  }

  Widget _getOverview() {
    return new InkWell(
      onTap: _onOverviewTap,
      child: new Padding(
        padding: new EdgeInsets.all(_OVERVIEW_PADDING),
        child: new Text(
          widget._movie.overview,
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

  void _loadDetail() {
    GetDetail getDetail = InteractorsProvider.getDetailInteractor();
    getDetail.id = widget._movie.id;
    getDetail.execute()
      .then(_onDetailLoadSuccess)
      .catchError(_onDetailLoadError);
  }

  void _onDetailLoadSuccess(Detail detail) {
    print(detail.overview);
  }

  void _onDetailLoadError(dynamic error) => print(error);

  void _loadBigBackdropWithDelay() {
    new Future.delayed(new Duration(milliseconds: _BIG_BACKDROP_DELAY), () {
      setState(() {
        _backdropSize = BackdropSize.BIG;
      });
    });
  }

  int _getOverviewMaxLines() {
    return _isOverviewCollapsed ? _OVERVIEW_COLLAPSED_LINES : _OVERVIEW_EXPANDED_LINES;
  }

}
