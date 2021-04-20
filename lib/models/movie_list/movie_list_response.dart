import 'package:json_annotation/json_annotation.dart';

import 'movie_list.dart';
part 'movie_list_response.g.dart';


@JsonSerializable()
class MovieListResponse {
int page;
List<MovieList>results;
@JsonKey(name: 'total_pages')
int totalPages;
@JsonKey(name: 'total_results')
int totalResults;
int id;
MovieListResponse();


  factory MovieListResponse.fromJson(Map<String, dynamic> json) => _$MovieListResponseFromJson(json);

  Map<String, dynamic> toJson() => _$MovieListResponseToJson(this);
}
