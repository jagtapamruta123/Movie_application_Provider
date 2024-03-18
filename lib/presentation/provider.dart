import 'package:flutter/cupertino.dart';
import 'package:movie_app_assignment/data/model/common_response_model.dart';
import 'package:movie_app_assignment/data/model/movie_model.dart';
import 'package:movie_app_assignment/data/model/movies_response_model.dart';
import 'package:movie_app_assignment/domain/repo/movie_repo.dart';
import 'package:movie_app_assignment/utils/app_constants.dart';

class MovieProvider extends ChangeNotifier {
  bool expanded = false;
  int page = 1;
  late MovieRepo _movieRepo; //declare private var
  bool? isMoviesLoadMore = false;
  List<MovieModel> movies = [];
  MovieProvider() {
    _movieRepo = MovieRepo();
  }

  setShowMore() {
    expanded = !expanded;
     notifyListeners();
    
  }

  getMoviesData({int page = 1}) async {
    isMoviesLoadMore =true;
    ResponseModel response =
        await _movieRepo.getData(Apis.getMovies + '$page');
    if (response.isSuccess!) {
       isMoviesLoadMore =false;
      MoviesResponseModel moviesData =
          MoviesResponseModel.fromJson(response.data);
      movies.addAll(moviesData.Search);
    } else {
       isMoviesLoadMore =false;
      movies.clear();
    }
    notifyListeners();
  }
}
