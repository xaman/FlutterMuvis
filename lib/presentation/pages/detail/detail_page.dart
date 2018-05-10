import 'dart:async';

import 'package:flutter/material.dart';

import 'package:fluttermuvis/domain/interactor/interactors_provider.dart';
import 'package:fluttermuvis/domain/interactor/get_detail.dart';
import 'package:fluttermuvis/domain/interactor/get_credits.dart';
import 'package:fluttermuvis/domain/model/movie.dart';
import 'package:fluttermuvis/domain/model/detail.dart';
import 'package:fluttermuvis/domain/model/cast.dart';
import 'package:fluttermuvis/domain/model/backdrop_size.dart';
import 'package:fluttermuvis/presentation/res/theme_colors.dart';
import 'package:fluttermuvis/presentation/pages/detail/detail_header.dart';
import 'package:fluttermuvis/presentation/pages/detail/detail_description.dart';
import 'package:fluttermuvis/presentation/pages/detail/detail_overview.dart';

const int _BIG_BACKDROP_DELAY = 1000;

class DetailPage extends StatefulWidget {

  final Movie _movie;

  DetailPage(this._movie);

  @override
  State<StatefulWidget> createState() => new _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {

  BuildContext _scaffoldContext;
  Detail _detail;
  List<Cast> _credits;
  BackdropSize _backdropSize = BackdropSize.SMALL;

  @override
  void initState() {
    super.initState();
    _loadDetail();
    _loadCredits();
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
              new DetailDescription(widget._movie, _detail),
              new DetailOverview(widget._movie.overview),
            ],
          ),
        );
      })
    );
  }

  void _loadDetail() {
    GetDetail getDetail = InteractorsProvider.getDetailInteractor();
    getDetail.id = widget._movie.id;
    getDetail.execute()
      .then(_onDetailLoadSuccess)
      .catchError(_onLoadError);
  }

  void _onDetailLoadSuccess(Detail detail) => setState(() { _detail = detail; });

  void _loadCredits() {
    GetCredits getCredits = InteractorsProvider.getCreditsInteractor();
    getCredits.id = widget._movie.id;
    getCredits.execute()
      .then(_onCreditsLoadSuccess)
      .catchError(_onLoadError);
  }

  void _onCreditsLoadSuccess(List<Cast> credits) => setState(() { _credits = credits; });

  void _onLoadError(dynamic error) => print(error);

  void _loadBigBackdropWithDelay() {
    new Future.delayed(new Duration(milliseconds: _BIG_BACKDROP_DELAY), () {
      setState(() {
        _backdropSize = BackdropSize.BIG;
      });
    });
  }

}
