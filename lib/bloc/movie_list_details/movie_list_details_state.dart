import 'file:///C:/Users/ola77/AndroidStudioProjects/films_app/lib/models/movie_list/movie_list.dart';
import 'file:///C:/Users/ola77/AndroidStudioProjects/films_app/lib/models/movie_list_details/movie_list_details.dart';
import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';


abstract class MovieListDetailsState extends Equatable {
  MovieListDetailsState();

  List get props => [];
}

class MovieListDetailsInitial extends MovieListDetailsState {
  @override
  String toString() => 'MovieListInitial';
}

class MovieListDetailsLoading extends MovieListDetailsState {}

class MovieListDetailsSuccess extends MovieListDetailsState {
  List<MovieList> details ;
 // final bool hasReachedMax = false;

  MovieListDetailsSuccess
      ({ this.details});

 List<Object> get props => [details,];
}



class MovieListDetailsFailure extends MovieListDetailsState {
  final String error;

  MovieListDetailsFailure({@required this.error});

  List get props => [error];

  @override
  String toString() => 'MenuListFailure { error: $error }';
}
