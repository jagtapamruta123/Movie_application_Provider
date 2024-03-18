
import 'package:json_annotation/json_annotation.dart';
import 'package:movie_app_assignment/data/model/movie_model.dart';
part 'movies_response_model.g.dart';

@JsonSerializable()
class MoviesResponseModel{
 String? Response;
  String? totalResults;
  List<MovieModel> Search;
  MoviesResponseModel({required this.Response, this.totalResults,required this.Search});
  factory MoviesResponseModel.fromJson(Map<String, dynamic> json) =>
      _$MoviesResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$MoviesResponseModelToJson(this);
}
