import 'package:flutter/material.dart';

import '../res/theme_colors.dart';
import '../res/drawables.dart';

import '../widgets/empty_view.dart';
import '../widgets/home_bottom_navigation_bar.dart';

import '../../domain/model/movie.dart';
import '../../domain/interactor/get_movies.dart';
import '../../domain/interactor/interactors_provider.dart';


const double _TOOLBAR_LOGO_HEIGHT = 30.0;

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new _HomePageState();
}

class _HomePageState extends State<HomePage> {

  @override
  void initState() {
    super.initState();
    GetMovies getMovies = InteractorsProvider.getMoviesInteractor();
    getMovies.execute()
      .then(_handleMoviesLoadSuccess)
      .catchError((error) => _handleMoviesLoadError(error));
  }

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


  void _handleMoviesLoadSuccess(List<Movie> movies) {
    for (var movie in movies) { print(movie); }
  }

  void _handleMoviesLoadError(Exception exception) {}

}