import 'dart:ffi';
import 'package:json_annotation/json_annotation.dart';
part 'movie_list.g.dart';


@JsonSerializable()
class MovieList {
  bool adult;
  @JsonKey(name: 'backdrop_path')
  String backdropPath;
  @JsonKey(name: 'original_language')
  String originalLanguage;
  @JsonKey(name: 'original_title')
  String originalTitle;
  @JsonKey(name: 'poster_path')
  String posterPath;
  @JsonKey(name: 'release_date')
  String releaseDate;
  String overview;
  String title;
  bool video;
  double popularity;
  @JsonKey(name: 'vote_average')
  double voteAverage;
  @JsonKey(name: 'vote_count')
  int voteCount;
  @JsonKey(name: 'genre_ids')
  List<int>genreIds;
  @JsonKey(name: 'favorite_count')
  int favoriteCount;
  int id;
  String iso_639_1;
  String description;
  @JsonKey(name: 'list_type')
  String listType;
  String name;


  MovieList({this.posterPath});


  factory MovieList.fromJson(Map<String, dynamic> json) => _$MovieListFromJson(json);

  Map<String, dynamic> toJson() => _$MovieListToJson(this);
}
