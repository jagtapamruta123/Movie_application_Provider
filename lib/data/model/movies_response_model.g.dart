// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movies_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MoviesResponseModel _$MoviesResponseModelFromJson(Map<String, dynamic> json) =>
    MoviesResponseModel(
      Response: json['Response'] as String?,
      totalResults: json['totalResults'] as String?,
      Search: (json['Search'] as List<dynamic>)
          .map((e) => MovieModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$MoviesResponseModelToJson(
        MoviesResponseModel instance) =>
    <String, dynamic>{
      'Response': instance.Response,
      'totalResults': instance.totalResults,
      'Search': instance.Search,
    };
