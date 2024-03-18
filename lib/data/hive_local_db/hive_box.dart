import 'package:hive/hive.dart';
import 'package:movie_app_assignment/common/resources/app_strings.dart';
import 'package:movie_app_assignment/data/hive_local_db/hive_movies_response_model.dart';

class HiveBoxes {
  static Box<HiveResponseMovieModel> getMoviesBox() =>
      Hive.box<HiveResponseMovieModel>(AppStrings().offline_box_name);
}
