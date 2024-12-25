// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'facility.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Facility _$FacilityFromJson(Map<String, dynamic> json) => Facility(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String?,
      amenity: json['amenity'] as String?,
      cord: json['cord'] as String?,
      location: json['location'] as String?,
    );

Map<String, dynamic> _$FacilityToJson(Facility instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'amenity': instance.amenity,
      'cord': instance.cord,
      'location': instance.location,
    };
