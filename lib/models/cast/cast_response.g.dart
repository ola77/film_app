// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cast_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CastResponse _$CastResponseFromJson(Map<String, dynamic> json) {
  return CastResponse()
    ..id = json['id'] as int
    ..cast = (json['cast'] as List)
        ?.map((e) =>
            e == null ? null : CastDetails.fromJson(e as Map<String, dynamic>))
        ?.toList()
    ..crew = (json['crew'] as List)
        ?.map((e) =>
            e == null ? null : CastDetails.fromJson(e as Map<String, dynamic>))
        ?.toList();
}

Map<String, dynamic> _$CastResponseToJson(CastResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'cast': instance.cast,
      'crew': instance.crew,
    };
