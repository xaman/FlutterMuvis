import 'package:flutter/material.dart';

import 'package:fluttermuvis/domain/model/movie.dart';
import 'package:fluttermuvis/domain/interactor/get_movies.dart';
import 'package:fluttermuvis/domain/interactor/interactors_provider.dart';
import 'package:fluttermuvis/presentation/res/theme_colors.dart';
import 'package:fluttermuvis/presentation/res/drawables.dart';
import 'package:fluttermuvis/presentation/widgets/empty_view.dart';
import 'package:fluttermuvis/presentation/widgets/home_bottom_navigation_bar.dart';
import 'package:fluttermuvis/presentation/widgets/movies_grid_view.dart';
import 'package:fluttermuvis/presentation/widgets/toolbar_progress.dart';


const double _TOOLBAR_LOGO_HEIGHT = 30.0;

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new _HomePageState();
}

class _HomePageState extends State<HomePage> {

  bool _isLoading = false;
  List<Movie> _movies = new List();
  BuildContext _scaffoldContext;

  @override
  void initState() {
    super.initState();
    _isLoading = true;
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
        title: new Image.asset(Drawables.TOOLBAR_LOGO, height: _TOOLBAR_LOGO_HEIGHT),
        actions: <Widget>[
          _getToolbarProgress()
        ],
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

  Widget _getToolbarProgress() => _isLoading ? new ToolbarProgress() : new Container();

  void _handleMoviesLoadSuccess(List<Movie> movies) {
    this.setState((){
      _isLoading = false;
      _movies = movies;
    });
  }

  void _handleMoviesLoadError(Exception exception) {
    this.setState((){
      _isLoading = false;
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