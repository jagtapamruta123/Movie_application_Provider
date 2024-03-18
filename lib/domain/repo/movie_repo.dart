import 'package:dio/dio.dart';
import 'package:movie_app_assignment/common/network/HTTP.dart';
import 'package:movie_app_assignment/data/hive_local_db/hive_movies_response_model.dart';

import 'package:movie_app_assignment/data/hive_local_db/hive_service.dart';
import 'package:movie_app_assignment/data/model/common_response_model.dart';

import 'package:movie_app_assignment/utils/internate_connectivity.dart';

class MovieRepo {
  late NetworkInfoImpl _networkInfoImpl;
  MovieRepo() {
    this._networkInfoImpl = NetworkInfoImpl();
  }
  Future<ResponseModel> getData(String url) async {
    print(url);
    Response? response;
    try {
      response = await HTTP.others.get(
        url,
      );
      if (response.statusCode == 200 || response.statusCode == 201) {
        //stored data in hive
        HiveResponseMovieModel moviesData =
            HiveResponseMovieModel.fromJson(response.data);

        HiveMoviesService.putAllMoviesData('All_Data', moviesData);
        //get data from hive since not able to all data at a time so I have not set the local data to screen
        //but we can handle the hive data here and map to response directly
        HiveMoviesService.getAllMoviesData();
        return ResponseModel(
            data: response.data,
            isSuccess: true,
            statusCode: response.statusCode);
      } else {
        return ResponseModel(
            data: null,
            isSuccess: false,
            message: 'Error occured with ${response.statusCode}',
            statusCode: response.statusCode);
      }
    } catch (e) {
      return ResponseModel(data: null, isSuccess: false, statusCode: null);
    }
  }
}
