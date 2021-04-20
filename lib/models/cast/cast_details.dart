import 'package:json_annotation/json_annotation.dart';
import 'dart:ffi';
import 'package:json_annotation/json_annotation.dart';
part 'cast_details.g.dart';


@JsonSerializable()
class CastDetails {
  bool adult;
  int gender;
  int id;
  @JsonKey(name: 'known_for_department')
  String knownForDepartment;
  String name;
  @JsonKey(name: 'original_name')
  String originalName;
  double popularity;
  @JsonKey(name: 'profile_path')
  String profilePath;
  @JsonKey(name: 'cast_id')
  int castId;
  String character;
  @JsonKey(name: 'credit_id')
  String creditId;
  int order;
  String department;
  String job;




  CastDetails();


  factory CastDetails.fromJson(Map<String, dynamic> json) => _$CastDetailsFromJson(json);

  Map<String, dynamic> toJson() => _$CastDetailsToJson(this);
}
