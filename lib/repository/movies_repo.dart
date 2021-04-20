import 'dart:convert';
import 'dart:io';
import 'package:films_app/bloc/config.dart';
import 'file:///C:/Users/ola77/AndroidStudioProjects/films_app/lib/models/movie_list/movie_list_response.dart';
import 'package:films_app/utilities/bearer_token.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;


class MoviesRepository {
    static const Popular='popular';
    static const Latest='upcoming';
    static const NowPlaying='now_playing';

    static Future<MovieListResponse> getResults(String type) async {

    var response = await http.get('${BASE_URL()}/$type?api_key=6fbf3b1a515fe8ef2c494c4fe8085a6a',
        headers: {
          "Content-Type": "application/json",
        });

    print(utf8.decode(response.bodyBytes));

    return MovieListResponse.fromJson(
        JsonDecoder().convert(utf8.decode(response.bodyBytes)));
  }
}
