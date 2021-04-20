import 'file:///C:/Users/ola77/AndroidStudioProjects/films_app/lib/models/movie_list/movie_list.dart';
import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';


abstract class MovieListState extends Equatable {
  MovieListState();

  List get props => [];
}

class MovieListInitial extends MovieListState {
  @override
  String toString() => 'MovieListInitial';
}

class MovieListLoading extends MovieListState {}


class MovieListSuccess extends MovieListState {

  List<MovieList> results ;

  final bool hasReachedMax = false;

  MovieListSuccess
      ({ this.results});

 List<Object> get props => [results,hasReachedMax];
}



class MovieListFailure extends MovieListState {
  final String error;

  MovieListFailure({@required this.error});

  List get props => [error];

  @override
  String toString() => 'MenuListFailure { error: $error }';
}
