import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';


abstract class MovieListDetailsEvent extends Equatable {
  MovieListDetailsEvent();

  List<Object> get props => [];
}

class FetchMovieListDetails extends MovieListDetailsEvent {
  final String id;

  FetchMovieListDetails({this.id});




  @override
  String toString() => 'MovieListDetailsButtonPressed   ';
}
