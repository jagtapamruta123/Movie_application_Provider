import 'package:hive/hive.dart';
import 'package:movie_app_assignment/common/resources/app_strings.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:movie_app_assignment/data/hive_local_db/hive_movie_model.dart';
import 'package:movie_app_assignment/data/hive_local_db/hive_movies_response_model.dart';
import 'package:path_provider/path_provider.dart' as path_provider;

class HiveConfigurations {
  static init() async {
    try {
      // Get your application's file path inside phone
      final appDocumentDirectory =
          await path_provider.getApplicationDocumentsDirectory();

      // initialize hive database in that file
      Hive.init(appDocumentDirectory.path);
      await Hive.initFlutter(AppStrings().offline_db_name);

      // Registering TypeAdapter
      Hive.registerAdapter(HiveResponseMovieModelAdapter());
      // Opening database to use
      // await Hive.openBox<HiveResponseMovieModel>(
      //   AppStrings().offline_box_name,
      // );
      Hive.registerAdapter(HiveMovieModelAdapter());
      // Opening database to use
      await Hive.openBox<HiveResponseMovieModel>(
        AppStrings().offline_box_name,
      );
    } catch (e) {
      print('Hive Exceptions ${e.toString()}');
    }
  }

  //clr data from the disk
  static clearAllData() async {
    Hive.deleteFromDisk();
  }
}
