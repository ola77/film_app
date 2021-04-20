import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';


abstract class MovieListEvent extends Equatable {
  MovieListEvent();

  List<Object> get props => [];
}

class FetchMovieList extends MovieListEvent {
    final String type;
  FetchMovieList({this.type});

  @override
  String toString() => 'MovieListButtonPressed   ';
}
