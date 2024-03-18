// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hive_movies_response_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class HiveResponseMovieModelAdapter
    extends TypeAdapter<HiveResponseMovieModel> {
  @override
  final int typeId = 1;

  @override
  HiveResponseMovieModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return HiveResponseMovieModel(
      Search:
          fields[0] == null ? [] : (fields[0] as List?)?.cast<HiveMovieModel>(),
      totalResults: fields[1] as String?,
      Response: fields[2] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, HiveResponseMovieModel obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.Search)
      ..writeByte(1)
      ..write(obj.totalResults)
      ..writeByte(2)
      ..write(obj.Response);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is HiveResponseMovieModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HiveResponseMovieModel _$HiveResponseMovieModelFromJson(
        Map<String, dynamic> json) =>
    HiveResponseMovieModel(
      Search: (json['Search'] as List<dynamic>?)
          ?.map((e) => HiveMovieModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      totalResults: json['totalResults'] as String?,
      Response: json['Response'] as String?,
    );

Map<String, dynamic> _$HiveResponseMovieModelToJson(
        HiveResponseMovieModel instance) =>
    <String, dynamic>{
      'Search': instance.Search,
      'totalResults': instance.totalResults,
      'Response': instance.Response,
    };
