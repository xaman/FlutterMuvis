import 'package:flutter/material.dart';

import 'package:fluttermuvis/domain/model/movie.dart';
import 'package:fluttermuvis/domain/interactor/get_movies.dart';
import 'package:fluttermuvis/domain/interactor/interactors_provider.dart';
import 'package:fluttermuvis/presentation/res/theme_colors.dart';
import 'package:fluttermuvis/presentation/res/drawables.dart';
import 'package:fluttermuvis/presentation/widgets/empty_view.dart';
import 'package:fluttermuvis/presentation/pages/home/home_bottom_navigation_bar.dart';
import 'package:fluttermuvis/presentation/pages/home/movies_grid_view.dart';
import 'package:fluttermuvis/presentation/widgets/toolbar_progress.dart';
import 'package:fluttermuvis/presentation/pages/detail/detail_page.dart';


const int _NUM_PAGES = 2;
const int _PAGE_CHANGE_DURATION = 300;
const double _TOOLBAR_LOGO_HEIGHT = 30.0;

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new _HomePageState();
}

class _HomePageState extends State<HomePage> {

  BuildContext _scaffoldContext;
  PageController _controller;
  bool _isLoading;
  int _moviesPagination;
  double _moviesScrollPosition;
  int _currentPagePosition;
  List<Movie> _movies;

  @override
  void initState() {
    super.initState();
    _isLoading = false;
    _moviesPagination = 1;
    _moviesScrollPosition = 0.0;
    _currentPagePosition = 0;
    _movies = new List();
    _controller = new PageController(initialPage: _currentPagePosition);
    _loadMovies();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        backgroundColor: ThemeColors.strawberry,
        title: new Image.asset(Drawables.TOOLBAR_LOGO, height: _TOOLBAR_LOGO_HEIGHT),
        actions: <Widget>[
          _createToolbarProgress()
        ],
      ),
      body: new Builder(builder: (context) {
        _scaffoldContext = context;
        return _createPager();
      }),
      bottomNavigationBar: new HomeBottomNavigationBar(_currentPagePosition, _handleNavigationItemSelected),
    );
  }

  Widget _createPager() {
    return new PageView.builder(
      physics: new AlwaysScrollableScrollPhysics(),
      controller: _controller,
      onPageChanged: _handlePageChange,
      itemBuilder: (context, index) => _createPage(index),
      itemCount: _NUM_PAGES,
    );
  }

  Widget _createToolbarProgress() => _isLoading ? new ToolbarProgress() : new Container();

  Widget _createPage(int index) => index == 0 ? _createBody() : _createFavoritesEmpty();

  Widget _createBody() => _movies.isEmpty ? _createEmptyView() : _createMoviesGrid();

  Widget _createEmptyView() => new EmptyView(Drawables.IC_EMPTY_MOVIES, "Where are the movies?");

  Widget _createMoviesGrid() => new MoviesGridView(
    _movies,
    _handleMovieClick,
    _moviesScrollPosition,
    _onMoviesScrollChange,
    _onMoviesListBottom
  );

  Widget _createFavoritesEmpty() => new EmptyView(Drawables.IC_EMPTY_FAVORITES, "What is your favorite movie?");

  void _onMoviesScrollChange(double offset) => _moviesScrollPosition = offset;

  void _onMoviesListBottom() => _loadMovies();

  void _handleNavigationItemSelected(int position) {
    _controller.animateToPage(
      position,
      duration: new Duration(milliseconds: _PAGE_CHANGE_DURATION),
      curve: Curves.ease
    );
  }

  void _handlePageChange(int position) {
    this.setState((){
      _currentPagePosition = position;
    });
  }

  void _loadMovies() {
    GetMovies getMovies = InteractorsProvider.getMoviesInteractor();
    getMovies.page = _moviesPagination++;
    getMovies.execute()
        .then(_handleMoviesLoadSuccess)
        .catchError((error) => _handleMoviesLoadError(error));
    this.setState(() => _isLoading = true);
  }

  void _handleMoviesLoadSuccess(List<Movie> movies) {
    this.setState((){
      _isLoading = false;
      _movies.addAll(movies);
    });
  }

  void _handleMoviesLoadError(Exception exception) {
    this.setState((){
      _isLoading = false;
    });
  }

  void _handleMovieClick(Movie movie) {
    Navigator.of(context).push(new MaterialPageRoute(builder: (_) => new DetailPage(movie)));
  }

}