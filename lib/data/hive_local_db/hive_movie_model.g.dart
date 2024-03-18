// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hive_movie_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class HiveMovieModelAdapter extends TypeAdapter<HiveMovieModel> {
  @override
  final int typeId = 0;

  @override
  HiveMovieModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return HiveMovieModel(
      Title: fields[0] as String?,
      Year: fields[1] as String?,
      Poster: fields[2] as String?,
      imdbID: fields[3] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, HiveMovieModel obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.Title)
      ..writeByte(1)
      ..write(obj.Year)
      ..writeByte(2)
      ..write(obj.Poster)
      ..writeByte(3)
      ..write(obj.imdbID);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is HiveMovieModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HiveMovieModel _$HiveMovieModelFromJson(Map<String, dynamic> json) =>
    HiveMovieModel(
      Title: json['Title'] as String?,
      Year: json['Year'] as String?,
      Poster: json['Poster'] as String?,
      imdbID: json['imdbID'] as String?,
    );

Map<String, dynamic> _$HiveMovieModelToJson(HiveMovieModel instance) =>
    <String, dynamic>{
      'Title': instance.Title,
      'Year': instance.Year,
      'Poster': instance.Poster,
      'imdbID': instance.imdbID,
    };
