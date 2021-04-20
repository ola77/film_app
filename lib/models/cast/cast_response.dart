import 'package:films_app/models/cast/cast_details.dart';
import 'package:json_annotation/json_annotation.dart';
part 'cast_response.g.dart';


@JsonSerializable()
class CastResponse {
  int id;
  List<CastDetails>cast;
  List<CastDetails>crew;

  CastResponse();


  factory CastResponse.fromJson(Map<String, dynamic> json) => _$CastResponseFromJson(json);

  Map<String, dynamic> toJson() => _$CastResponseToJson(this);
}
