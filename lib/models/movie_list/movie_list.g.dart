// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie_list.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MovieList _$MovieListFromJson(Map<String, dynamic> json) {
  return MovieList(
    posterPath: json['poster_path'] as String,
  )
    ..adult = json['adult'] as bool
    ..backdropPath = json['backdrop_path'] as String
    ..originalLanguage = json['original_language'] as String
    ..originalTitle = json['original_title'] as String
    ..releaseDate = json['release_date'] as String
    ..overview = json['overview'] as String
    ..title = json['title'] as String
    ..video = json['video'] as bool
    ..popularity = (json['popularity'] as num)?.toDouble()
    ..voteAverage = (json['vote_average'] as num)?.toDouble()
    ..voteCount = json['vote_count'] as int
    ..genreIds = (json['genre_ids'] as List)?.map((e) => e as int)?.toList()
    ..favoriteCount = json['favorite_count'] as int
    ..id = json['id'] as int
    ..iso_639_1 = json['iso_639_1'] as String
    ..description = json['description'] as String
    ..listType = json['list_type'] as String
    ..name = json['name'] as String;
}

Map<String, dynamic> _$MovieListToJson(MovieList instance) => <String, dynamic>{
      'adult': instance.adult,
      'backdrop_path': instance.backdropPath,
      'original_language': instance.originalLanguage,
      'original_title': instance.originalTitle,
      'poster_path': instance.posterPath,
      'release_date': instance.releaseDate,
      'overview': instance.overview,
      'title': instance.title,
      'video': instance.video,
      'popularity': instance.popularity,
      'vote_average': instance.voteAverage,
      'vote_count': instance.voteCount,
      'genre_ids': instance.genreIds,
      'favorite_count': instance.favoriteCount,
      'id': instance.id,
      'iso_639_1': instance.iso_639_1,
      'description': instance.description,
      'list_type': instance.listType,
      'name': instance.name,
    };
