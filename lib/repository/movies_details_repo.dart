import 'dart:convert';
import 'package:films_app/bloc/config.dart';
import 'package:films_app/models/movie_list/movie_list_response.dart';
import 'package:http/http.dart' as http;


class MoviesListDetailsRepository {
  static const id='id';
  static Future<MovieListResponse> getDetails(String id) async {

    var response = await http.get('${BASE_URL()}/464052/lists?api_key=6fbf3b1a515fe8ef2c494c4fe8085a6a&language=en-US&page=1',
        headers: {
          "Content-Type": "application/json",
        });

    print(utf8.decode(response.bodyBytes));

    return MovieListResponse.fromJson(
        JsonDecoder().convert(utf8.decode(response.bodyBytes)));
  }
}
