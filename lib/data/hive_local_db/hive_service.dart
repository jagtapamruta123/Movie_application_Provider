import 'package:hive/hive.dart';
import 'package:movie_app_assignment/data/hive_local_db/hive_box.dart';
import 'package:movie_app_assignment/data/hive_local_db/hive_movies_response_model.dart';

class HiveMoviesService {
  static Box moviesBox = HiveBoxes.getMoviesBox();

//add data to hive
  static putAllMoviesData(
      String key, HiveResponseMovieModel hiveMoviesApiModel) async {
    await moviesBox.put(key, hiveMoviesApiModel); //storing data
  }

  static Future<HiveResponseMovieModel> getAllMoviesData() async {
    print(moviesBox.values.toList());
    // Retrieve all items from the box
    HiveResponseMovieModel movies = moviesBox.get('All_Data');
    print(movies);
    return movies;
  }
}
