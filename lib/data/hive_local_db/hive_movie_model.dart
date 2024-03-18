import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

part 'hive_movie_model.g.dart';

@JsonSerializable()
@HiveType(typeId: 0) //unique Id for the class
class HiveMovieModel{
   @HiveField(0, defaultValue: null)
  String? Title;
  @HiveField(1, defaultValue: null)
 String? Year;
  @HiveField(2, defaultValue: null)
 String? Poster;
 @HiveField(3, defaultValue: null)
 String? imdbID;

 HiveMovieModel({this.Title, this.Year, this.Poster,this.imdbID});

  factory HiveMovieModel.fromJson(Map<String, dynamic> json) =>
      _$HiveMovieModelFromJson(json);

  Map<String, dynamic> toJson() => _$HiveMovieModelToJson(this);
}