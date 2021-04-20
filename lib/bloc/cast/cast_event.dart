import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';


abstract class CastEvent extends Equatable {
  CastEvent();

  List<Object> get props => [];
}

class FetchCastList extends CastEvent {
  final int id;

  FetchCastList({this.id});

  @override
  String toString() => '  ';


}
