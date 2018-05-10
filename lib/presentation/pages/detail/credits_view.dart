import 'package:flutter/material.dart';

import 'package:fluttermuvis/domain/model/cast.dart';
import 'package:fluttermuvis/presentation/pages/detail/cast_item.dart';
import 'package:fluttermuvis/utils/lists.dart';

const double _HEIGHT = 185.0;
const double _PADDING = 5.0;

class CreditsView extends StatelessWidget {

  final List<Cast> _credits;

  CreditsView(this._credits);

  @override
  Widget build(BuildContext context) {
    return Lists.notEmpty(_credits) ?
      new SizedBox(
        height: _HEIGHT,
        child: new ListView.builder(
          itemBuilder: (_, index) => _createItem(index),
          scrollDirection: Axis.horizontal,
          itemCount: _credits.length,
          padding: new EdgeInsets.all(_PADDING),
        )
      ) :
      new Container();
  }

  Widget _createItem(int index) {
    return new CastItem(_credits[index]);
  }

}