import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:movie_app_assignment/data/hive_local_db/hive_movie_model.dart';

part 'hive_movies_response_model.g.dart';

@JsonSerializable()
@HiveType(typeId: 1) //unique Id for the class
class HiveResponseMovieModel {
  @HiveField(0, defaultValue: [])
  List<HiveMovieModel>? Search;
  @HiveField(1, defaultValue: null)
  String? totalResults;
  @HiveField(2, defaultValue: null)
  String? Response;

  HiveResponseMovieModel({this.Search, this.totalResults, this.Response});

  factory HiveResponseMovieModel.fromJson(Map<String, dynamic> json) =>
      _$HiveResponseMovieModelFromJson(json);

  Map<String, dynamic> toJson() => _$HiveResponseMovieModelToJson(this);
}
