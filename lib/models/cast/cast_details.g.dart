// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cast_details.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CastDetails _$CastDetailsFromJson(Map<String, dynamic> json) {
  return CastDetails()
    ..adult = json['adult'] as bool
    ..gender = json['gender'] as int
    ..id = json['id'] as int
    ..knownForDepartment = json['known_for_department'] as String
    ..name = json['name'] as String
    ..originalName = json['original_name'] as String
    ..popularity = (json['popularity'] as num)?.toDouble()
    ..profilePath = json['profile_path'] as String
    ..castId = json['cast_id'] as int
    ..character = json['character'] as String
    ..creditId = json['credit_id'] as String
    ..order = json['order'] as int
    ..department = json['department'] as String
    ..job = json['job'] as String;
}

Map<String, dynamic> _$CastDetailsToJson(CastDetails instance) =>
    <String, dynamic>{
      'adult': instance.adult,
      'gender': instance.gender,
      'id': instance.id,
      'known_for_department': instance.knownForDepartment,
      'name': instance.name,
      'original_name': instance.originalName,
      'popularity': instance.popularity,
      'profile_path': instance.profilePath,
      'cast_id': instance.castId,
      'character': instance.character,
      'credit_id': instance.creditId,
      'order': instance.order,
      'department': instance.department,
      'job': instance.job,
    };
