
import 'package:json_annotation/json_annotation.dart';
part 'movie_model.g.dart';

@JsonSerializable()
class MovieModel{
 String Title;
  String? Year;
  String Poster;
  String? imdbID;
  MovieModel({required this.Title, this.Year,required this.Poster,this.imdbID});
  factory MovieModel.fromJson(Map<String, dynamic> json) =>
      _$MovieModelFromJson(json);

  Map<String, dynamic> toJson() => _$MovieModelToJson(this);
}
