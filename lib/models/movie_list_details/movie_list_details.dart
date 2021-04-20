import 'dart:ffi';
import 'package:json_annotation/json_annotation.dart';
part 'movie_list_details.g.dart';


@JsonSerializable()
class MovieListDetails {


  String description;
  @JsonKey(name: 'favorite_count')
  int favoriteCount;
  int id;
  String iso_639_1;
  @JsonKey(name: 'poster_path')
  String posterPath;
  @JsonKey(name: 'list_type')
  String listType;
  String name;



  MovieListDetails();


  factory MovieListDetails.fromJson(Map<String, dynamic> json) => _$MovieListDetailsFromJson(json);

  Map<String, dynamic> toJson() => _$MovieListDetailsToJson(this);
}
