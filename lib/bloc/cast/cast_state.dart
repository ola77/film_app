import 'file:///C:/Users/ola77/AndroidStudioProjects/films_app/lib/models/movie_list/movie_list.dart';
import 'package:films_app/models/cast/cast_details.dart';
import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';


abstract class CastState extends Equatable {
  CastState();

  List get props => [];
}

class CastInitial extends CastState {
  @override
  String toString() => 'CastInitial';
}

class CastLoading extends CastState {}


class CastSuccess extends CastState {

  List<CastDetails> cast ;
  final bool hasReachedMax = false;

  CastSuccess
      ({ this.cast});

  List<Object> get props => [cast,hasReachedMax];
}



class CastFailure extends CastState {
  final String error;

  CastFailure({@required this.error});

  List get props => [error];

  @override
  String toString() => 'MenuListFailure { error: $error }';
}
