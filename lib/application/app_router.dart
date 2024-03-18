import 'package:flutter/material.dart';
import 'package:movie_app_assignment/data/model/movie_model.dart';
import 'package:movie_app_assignment/presentation/screen/movie_details_screen.dart';
import 'package:movie_app_assignment/presentation/screen/movies_screen.dart';

class RouteName {
  static const movieDetails = '/movieDetails';
}

class AppRouter {
  static final AppRouter _router =
      AppRouter._internal(); //create global instace of the class

  factory AppRouter() =>
      _router; //factpry constructor responsible for the object creation of the class

  AppRouter._internal(); //private constructor

  //app router class , can use pkgs to manage routing
  Route? router(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return _gotoInitialPage(); //movies screen

      case RouteName.movieDetails:
        return _gotoMovieDetailsPage(
            settings, settings.arguments as MovieModel); //MovieDetails
      default:
        return _gotoInitialPage();
    }
  }

  MaterialPageRoute _gotoInitialPage() {
    return MaterialPageRoute(builder: (BuildContext context) {
      return const MoviesScreen();
    });
  }

  PageRouteBuilder _gotoMovieDetailsPage(
      RouteSettings settings, MovieModel argsData) {
    // settings.arguments
    final MovieModel args = argsData;
    return PageRouteBuilder(
        settings: settings,
        transitionDuration: Duration(seconds: 1),
        pageBuilder: (BuildContext context, _, __) {
          return MovieDetailsScreen(
            movieModel: args,
          );
        });
  }
}
