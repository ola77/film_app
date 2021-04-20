// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie_list_details.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MovieListDetails _$MovieListDetailsFromJson(Map<String, dynamic> json) {
  return MovieListDetails()
    ..description = json['description'] as String
    ..favoriteCount = json['favorite_count'] as int
    ..id = json['id'] as int
    ..iso_639_1 = json['iso_639_1'] as String
    ..posterPath = json['poster_path'] as String
    ..listType = json['list_type'] as String
    ..name = json['name'] as String;
}

Map<String, dynamic> _$MovieListDetailsToJson(MovieListDetails instance) =>
    <String, dynamic>{
      'description': instance.description,
      'favorite_count': instance.favoriteCount,
      'id': instance.id,
      'iso_639_1': instance.iso_639_1,
      'poster_path': instance.posterPath,
      'list_type': instance.listType,
      'name': instance.name,
    };
