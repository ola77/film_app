// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie_list_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MovieListResponse _$MovieListResponseFromJson(Map<String, dynamic> json) {
  return MovieListResponse()
    ..page = json['page'] as int
    ..results = (json['results'] as List)
        ?.map((e) =>
            e == null ? null : MovieList.fromJson(e as Map<String, dynamic>))
        ?.toList()
    ..totalPages = json['total_pages'] as int
    ..totalResults = json['total_results'] as int
    ..id = json['id'] as int;
}

Map<String, dynamic> _$MovieListResponseToJson(MovieListResponse instance) =>
    <String, dynamic>{
      'page': instance.page,
      'results': instance.results,
      'total_pages': instance.totalPages,
      'total_results': instance.totalResults,
      'id': instance.id,
    };
