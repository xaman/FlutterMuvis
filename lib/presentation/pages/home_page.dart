import 'package:flutter/material.dart';

import '../res/theme_colors.dart';
import '../res/drawables.dart';

import '../widgets/empty_view.dart';
import '../widgets/home_bottom_navigation_bar.dart';
import '../widgets/movies_grid_view.dart';

import '../../domain/model/movie.dart';
import '../../domain/interactor/get_movies.dart';
import '../../domain/interactor/interactors_provider.dart';


const double _TOOLBAR_LOGO_HEIGHT = 30.0;

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new _HomePageState();
}

class _HomePageState extends State<HomePage> {

  List<Movie> _movies = new List();
  BuildContext _scaffoldContext;

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
      body: new Builder(builder: (context) {
        _scaffoldContext = context;
        return _getBody();
      }),
      bottomNavigationBar: new HomeBottomNavigationBar(),
    );
  }


  Widget _getBody() => _movies.isEmpty ? _getEmptyView() : _getMoviesGrid();

  Widget _getEmptyView() => new EmptyView(Drawables.IC_EMPTY_MOVIES, "Where are the movies?");

  Widget _getMoviesGrid() => new MoviesGridView(_movies, _handleMovieClick);

  void _handleMoviesLoadSuccess(List<Movie> movies) {
    this.setState(() {
      _movies = movies;
    });
  }

  void _handleMoviesLoadError(Exception exception) {
    this.setState(() {
      _movies = new List();
    });
  }

  void _handleMovieClick(Movie movie) {
    _showSnackbar("Clicked on ${movie.title}");
  }

  void _showSnackbar(String text) {
    Scaffold.of(_scaffoldContext).showSnackBar(
      new SnackBar(
        content: new Text(text),
        duration: new Duration(milliseconds: 500),
      )
    );
  }

}